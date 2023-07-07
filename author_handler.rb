require 'json'

class AuthorHandler
  attr_reader :authors

  def initialize(authors)
    @authors = authors
  end

  def load_authors_from_json
    return unless File.exist?('authors.json')

    json_data = File.read('authors.json')
    author_data = JSON.parse(json_data)

    author_data.each do |author_info|
      id = author_info['id']
      first_name = author_info['first_name']
      last_name = author_info['last_name']
      items = author_info['items'].map { |item_data| Item.new(Date.parse(item_data['publish_date'])) }

      author = Author.new(id, first_name, last_name)
      author.items = items

      authors << author
    end
  end

  def list_authors
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
end
