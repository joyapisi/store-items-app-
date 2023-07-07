require './item'

def options
  puts 'Welcome to our Application'
  puts 'Please Choose from below options by number',
       '1-List all books',
       '2-List all music albums',
       '3-List all movies',
       '4-List of games',
       '5-List all genres (e.g "Comedy", "Thriller")',
       '6-List all labels (e.g. Gift, New)',
       '7-List all authors (e.g. Stephen King)',
       '8-List all sources (e.g. From a friend, Online shop)',
       '9-Add a book',
       '10-Add a music album',
       '11-Add a movie',
       '12-Add a game',
       '13-Quit Application'
end

def connection
  loop do
    options
    number = gets.chomp.to_i
    break if number == 13

    user_input(number)
  end
  puts 'Thank you for using our App'
end

ACTIONS = {
  1 => :list_books,
  2 => :list_music_albums,
  3 => :list_movies,
  4 => :list_games,
  5 => :list_genres,
  6 => :list_labels,
  7 => :list_authors,
  8 => :list_sources,
  9 => :add_book,
  10 => :add_music,
  11 => :add_movie,
  12 => :add_game
}.freeze

def user_input(number)
  action = ACTIONS[number]

  if action
    send(action)
  else
    puts 'Invalid number entered'
  end
end

def list_books
  puts 'book list'
end

def list_music_albums
  # code to list all music albums
end

def list_movies
  # code to list all movies
end

def list_games
  # code to list all games
end

def list_genres
  # code to list all genres
end

def list_labels
  # code to list all labels
end

def list_authors
  # code to list all authors
end

def list_sources
  # code to list all sources
end

def add_book
  # code to add a new book
end

def add_music
  # code to add a new music album
end

def add_movie
  # code to add a new movie
end

def add_game
  # code to add a new game
end

connection
