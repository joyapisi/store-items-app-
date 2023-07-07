require_relative 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Comedy')
  end

  it 'should create a new Genre instance' do
    expect(@genre).to be_instance_of Genre
  end

  describe '#name' do
    it 'should return the name of the Genre' do
      expect(@genre.name).to eq 'Comedy'
    end
  end

  describe '#item' do
    it 'should add an item in items list' do
      item = Item.new('12/05/1001')
      @genre.add_item(item)
      expect(@genre.items.length).to eq 1
      expect(@genre.items).to eq [item]
    end
  end
end
