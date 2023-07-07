require_relative 'spec_helper'
require 'date'

RSpec.describe Book do
  it 'creates a book' do
    book = Book.new('Joy', 'bad', Date.today)

    expect(book.publisher).to eq('Joy')
  end

  it 'checks if the book is archivable' do
    book1 = Book.new('Joy', 'bad', Date.today)
    expect(book1.can_be_archived?).to eq(true)

    book2 = Book.new('Joy', 'Good', Date.today)
    expect(book2.can_be_archived?).to eq(false)

    book3 = Book.new('Joy', 'Good', Date.today)
    expect(book3.can_be_archived?).to eq(false)
  end
end
