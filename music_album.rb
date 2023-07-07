require_relative 'item'

class MusicAlbum < Item
  attr_reader :publish_date
  attr_accessor :on_spotify, :name

  def initialize(name, on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
    @name = name
  end

  def can_be_archived?()
    super && @on_spotify ? true : false
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@name, @on_spotify, @publish_date]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
