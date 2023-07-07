require 'date'
require_relative 'spec_helper'

RSpec.describe Item do
  describe '#can_be_archived?' do
    context 'when publish date is more than 10 years ago' do
      it 'returns true' do
        item = Item.new(Date.today.prev_year(11))
        expect(item.can_be_archived?).to eq(true)
      end
    end

    context 'when publish date is less than 10 years ago' do
      it 'returns false' do
        item = Item.new(Date.today.prev_year(9))
        expect(item.can_be_archived?).to eq(false)
      end
    end
  end

  describe '#move_to_archive' do
    context 'when item can be archived' do
      it 'archives the item' do
        item = Item.new(Date.today.prev_year(11))
        item.move_to_archive
        expect(item.archived).to eq(true)
      end
    end

    context 'when item cannot be archived' do
      it 'does not archive the item' do
        item = Item.new(Date.today.prev_year(9))
        item.move_to_archive
        expect(item.archived).to eq(false)
      end
    end
  end

  describe '#add_genre=' do
    context 'when genre is not yet associated with item' do
      it 'adds the genre to the item and adds the item to the genre' do
        item = Item.new(Date.today.prev_year(11))
        genre = Genre.new('Horror')
        item.add_genre = genre
        expect(item.genre).to eq(genre)
        expect(genre.items).to include(item)
      end
    end

    context 'when genre is already associated with item' do
      it 'does not add the genre again to the item and does not add the item again to the genre' do
        item = Item.new(Date.today.prev_year(11))
        genre = Genre.new('Horror')
        item.add_genre = genre
        item.add_genre = genre
        expect(item.genre).to eq(genre)
        expect(genre.items.count(item)).to eq(1)
      end
    end
  end

  describe '#add_author=' do
    context 'when author is not yet associated with item' do
      it 'adds the author to the item and adds the item to the author' do
        item = Item.new(Date.today.prev_year(11))
        author = Author.new(2, 'Stephen', 'King')
        item.add_author = author
        expect(item.author).to eq(author)
        expect(author.items).to include(item)
      end
    end

    context 'when author is already associated with item' do
      it 'does not add the author again to the item and does not add the item again to the author' do
        item = Item.new(Date.today.prev_year(11))
        author = Author.new(2, 'Stephen', 'King')
        item.add_author = author
        item.add_author = author
        expect(item.author).to eq(author)
        expect(author.items.count(item)).to eq(1)
      end
    end
  end

  describe '#add_label=' do
    context 'when label is not yet associated with item' do
      it 'adds the label to the item and adds the item to the label' do
        item = Item.new(Date.today.prev_year(11))
        label = Label.new('Penguin Random House', 'blue')
        item.add_label = label
        expect(item.label).to eq(label)
        expect(label.items).to include(item)
      end
    end

    context 'when label is already associated with item' do
      it 'does not add the label again to the item and does not add the item again to the label' do
        item = Item.new(Date.today.prev_year(11))
        label = Label.new('Penguin Random House', 'blue')
        item.add_label = label
        item.add_label = label
        expect(item.label).to eq(label)
        expect(label.items.count(item)).to eq(1)
      end
    end
  end
end
