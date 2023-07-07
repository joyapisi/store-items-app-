require_relative 'item'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :publish_date

  def initialize(publisher, cover_state, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    super(publish_date)
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [publisher, cover_state, publish_date]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
