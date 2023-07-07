require_relative 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Comedy')
    @genre.add_item('item1')
    @genre.add_item('item2')
  end

  it 'should create a new Genre instance' do
    expect(@genre).to be_instance_of Genre
  end

  describe '#name' do
    it 'should return the name of the Genre' do
      expect(@genre.name).to eq 'Comedy'
    end
  end

  describe '#items' do
    it 'should return the item1 of the Genre' do
      expect(@genre.items[0]).to eq 'item1'
    end
    it 'should return the item2 of the Genre' do
      expect(@genre.items[1]).to eq 'item2'
    end
  end
end
