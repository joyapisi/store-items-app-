require_relative 'book'
require_relative 'label'
require 'fileutils'

class BookHandler
  attr_accessor :books, :labels

  def initialize
    created_books_file = create_new_json('books')
    @books = created_books_file ? JSON.parse(created_books_file.read, create_additions: true) : []
    created_labels_file = create_new_json('labels')
    @labels = created_labels_file ? JSON.parse(created_labels_file.read, create_additions: true) : []
  end

  def create_new_json(file_name)
    File.write("#{file_name}.json", []) unless File.exist?("#{file_name}.json")
    File.open("#{file_name}.json", 'r')
  end

  def save_book
    new_books = []

    @books.each do |book|
      new_books << { 'id' => book.id,
                     'publisher' => book.publisher,
                     'cover_state' => book.cover_state,
                     'publish_date' => book.publish_date }
    end
  end

  def save_label
    new_labels = []

    @labels.each do |label|
      new_labels << { 'title' => label.title,
                      'color' => label.color }
    end
  end

  def add_a_book
    puts 'Enter the Book\'s title:'
    title = gets.chomp

    puts 'Enter the Book\'s color:'
    color = gets.chomp

    puts 'Enter the Book\'s publisher:'
    publisher = gets.chomp

    puts 'Enter the Book\'s cover state (new/bad):'
    cover_state = gets.chomp.downcase

    puts 'Enter the Book\'s Published Date:'
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    @books << book

    label = Label.new(title, color)
    label.add_label(book)

    @labels << label

    save_book

    save_label

    puts '========================================'
    puts 'Your book bas been successfully created!'
    puts '========================================'
  end

  def list_books
    puts 'No books available in the list yet!' if @books.empty?

    @books.each do |book|
      puts '===================================='
      puts "Publisher: #{book.publisher} "
      puts "Cover Status: #{book.cover_state} "
      puts "published on: #{book.publish_date}"
      puts '===================================='
    end
  end

  def list_labels
    puts 'No labels available in the list yet!' if labels.empty?
    @labels.each { |label| puts "Title: #{label.title} color: #{label.color}" }
  end

  def keeping_data
    File.open('books.json', 'w+') do |file|
      books = JSON.dump(@books)
      file.write(books)
    end
    File.open('labels.json', 'w+') do |file|
      labels = JSON.dump(@labels)
      file.write(labels)
    end
  end
end
