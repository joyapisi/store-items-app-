require_relative 'books_operation'
require_relative 'music_genre_op'
require_relative 'game'
require_relative 'author'
require_relative 'game_handler'
require_relative 'author_handler'

def options
  puts '----------------------------------------------',
       'Please Choose from below options by number',
       '1-List all books',
       '2-List all music albums',
       '3-List of games',
       '4-List all genres (e.g "Comedy", "Thriller")',
       '5-List all labels (e.g. Gift, New)',
       '6-List all authors (e.g. Stephen King)',
       '7-Add a book',
       '8-Add a music album',
       '9-create a genre',
       '10-Add a game',
       '11-Quit Application',
       '----------------------------------------------'
end

def connection
  music_genre_operation = Operations.new
  books_operation = BookHandler.new
  methods_operation = [books_operation, music_genre_operation]

  authors = []
  author_handler = AuthorHandler.new(authors)
  author_handler.load_authors_from_json

  games = load_games_from_json
  game_handler = GameHandler.new(games)
  methods_operation = [books_operation, music_genre_operation, game_handler, author_handler]

  loop do
    options
    number = gets.chomp.to_i
    break if number == 11

    user_input(methods_operation, number, authors)
  end

  puts 'Thank you for using our App!'
  music_genre_operation.keeping_data
  books_operation.keeping_data
end

def load_games_from_json
  if File.exist?('games.json')
    json_data = File.read('games.json')
    JSON.parse(json_data).map do |game_data|
      Game.new(game_data['title'], game_data['multiplayer'], Date.parse(game_data['last_played_at']))
    end
  else
    []
  end
end

def user_input(methods_operation, number, authors)
  books_operation, music_genre_operation, game_handler, author_handler = methods_operation

  actions = {
    1 => lambda {
           books_operation.list_books
         },
    2 => -> { music_genre_operation.list_music_albums },
    3 => -> { game_handler.list_games },
    4 => -> { music_genre_operation.list_genres },
    5 => lambda {
           books_operation.list_labels
         },
    6 => lambda {
           puts 'No authors available in the list yet!' if authors.empty?
           author_handler.list_authors
         },
    7 => -> { books_operation.add_a_book },
    8 => -> { music_genre_operation.add_music },
    9 => -> { music_genre_operation.create_genre },
    10 => lambda {
            puts 'No games available in the list yet!' if game_handler.games.empty?
            game_handler.add_game
          }
  }

  action = actions[number]
  if action
    action.call
  else
    puts 'Invalid number entered'
  end
end

def list_authors(authors)
  puts 'Enter the author name or part of the name:'
  name = gets.chomp.downcase

  filtered_authors = authors.select { |author| author.full_name.downcase.include?(name) }

  if filtered_authors.empty?
    puts 'No authors found with the provided name.'
  else
    puts 'Authors matching the provided name:'
    filtered_authors.each do |author|
      puts author.full_name
    end
  end
end

connection
