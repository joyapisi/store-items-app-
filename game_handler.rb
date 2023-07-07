require 'json'

class GameHandler
  attr_reader :games

  def initialize(games)
    @games = games
  end

  def load_games_from_json
    return unless File.exist?('games.json')

    json_data = File.read('games.json')
    game_data = JSON.parse(json_data)

    game_data.each do |game_info|
      title = game_info['title']
      multiplayer = game_info['multiplayer']
      last_played_at = Date.parse(game_info['last_played_at'])

      game = Game.new(title, multiplayer, last_played_at)
      games << game
    end
  end

  def save_games_to_json
    json_data = games.map do |game|
      {
        'title' => game.title,
        'multiplayer' => game.multiplayer,
        'last_played_at' => game.last_played_at.to_s
      }
    end

    File.write('games.json', JSON.dump(json_data))
  end

  def list_games
    if games.empty?
      puts 'No games available in the list yet!'
    else
      puts 'List of games:'
      games.each do |game|
        puts "Title: #{game.title}, Multiplayer: #{game.multiplayer}, Last Played: #{game.last_played_at}"
      end
    end
  end

  def add_game
    puts 'Enter the game title:'
    title = gets.chomp

    puts 'Is the game multiplayer? (true/false):'
    multiplayer = gets.chomp.downcase == 'true'

    puts 'Enter the last played date (YYYY-MM-DD):'
    last_played_at = Date.parse(gets.chomp)

    game = Game.new(title, multiplayer, last_played_at)
    games << game

    puts 'Game added successfully!'

    save_games_to_json # Save the games to JSON file
  end
end
