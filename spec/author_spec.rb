require_relative '../author'
require_relative '../item'

RSpec.describe Author do
  describe '#initialize' do
    it 'sets the id, first_name, last_name, and items attributes' do
      author = Author.new(1, 'John', 'Doe')
      expect(author.id).to eq(1)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
      expect(author.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds the item to the author\'s items collection and sets the author property of the item' do
      author = Author.new(1, 'John', 'Doe')
      item = double('Item')

      expect(item).to receive(:author=).with(author)
      author.add_item(item)

      expect(author.items).to contain_exactly(item)
    end
  end
end
