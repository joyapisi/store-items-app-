require_relative 'spec_helper'

describe Operations do
  before :each do
    @op = Operations.new
  end

  it 'should create a new Operations instance' do
    expect(@op).to be_instance_of Operations
  end

  describe '#genre' do
    it 'should return the genre of the Operations' do
      @op.genre = %w[Thriller Romance]
      expect(@op.genre[0]).to eq 'Thriller'
    end
  end

  describe '#music_album' do
    it 'should return the music_album of the music_album' do
      @op.music_album = [{ name: 'My self', publish_date: '11/12/2015', on_spotify: true }]
      tester = @op.music_album[0]
      expect(tester[:on_spotify]).to eq true
    end
  end
end
