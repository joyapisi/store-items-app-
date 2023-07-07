require_relative 'spec_helper'

RSpec.describe Label do
  describe '#initialize' do
    it 'creates a new label with title and color' do
      label = Label.new('Title', 'Color')
      expect(label.title).to eq('Title')
      expect(label.color).to eq('Color')
      expect(label.items).to be_an(Array)
      expect(label.items).to be_empty
    end
  end

  describe '#add_label' do
    it 'adds a book to the label items' do
      label = Label.new('Title', 'Color')
      book = double('Book')
      label.add_label(book)
      expect(label.items).to include(book)
    end
  end
end
