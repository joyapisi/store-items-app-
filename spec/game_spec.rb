require_relative '../game'

RSpec.describe Game do
  describe '#initialize' do
    it 'sets the title, multiplayer, last_played_at, and archived attributes' do
      game = Game.new('Title', true, Date.today, archived: true)
      expect(game.title).to eq('Title')
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq(Date.today)
      expect(game.archived).to eq(true)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the game is not multiplayer and last played more than 2 years ago' do
      game = Game.new('Title', false, Date.today - (2 * 365) - 1)
      expect(game.can_be_archived?).to eq(true)
    end

    it 'returns false if the game is multiplayer' do
      game = Game.new('Title', true, Date.today - (2 * 365) - 1)
      expect(game.can_be_archived?).to eq(false)
    end

    it 'returns false if the game was last played within the past 2 years' do
      game = Game.new('Title', false, Date.today - (2 * 365))
      expect(game.can_be_archived?).to eq(false)
    end
  end
end
