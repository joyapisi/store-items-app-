require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :title

  def initialize(title, multiplayer, last_played_at, archived: false)
    super(Date.today, archived: archived)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    (super || !multiplayer) && last_played_at < (Date.today - (2 * 365))
  end
end
