require_relative '../author'
require_relative '../item'

RSpec.describe Author do
  before :each do
    @author = Author.new(1, 'John', 'Doe')
  end

  it 'should create a new Author instance' do
    expect(@author).to be_instance_of Author
  end

  describe '#initialize' do
    it 'sets the id, first_name, last_name, and items attributes' do
      expect(@author.id).to eq(1)
      expect(@author.first_name).to eq('John')
      expect(@author.last_name).to eq('Doe')
    end
  end

  describe '#add_item' do
    it 'should add an item in items list' do
      item = Item.new('12/05/1001')
      @author.add_item(item)
      expect(@author.items.length).to eq 1
      expect(@author.items).to eq [item]
    end
  end
end
