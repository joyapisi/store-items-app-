require_relative 'spec_helper'

RSpec.describe Label do
  before :each do
    @label = Label.new('Title', 'Color')
  end

  it 'should create a new Label instance' do
    expect(@label).to be_instance_of Label
  end

  describe '#initialize' do
    it 'creates a new label with title and color' do
      expect(@label.title).to eq('Title')
      expect(@label.color).to eq('Color')
    end
  end

  describe '#add_item' do
    it 'should add an item in items list' do
      item = Item.new('12/05/1001')
      @label.add_item(item)
      expect(@label.items.length).to eq 1
      expect(@label.items).to eq [item]
    end
  end
end
