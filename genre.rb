class Genre
  attr_reader :id
  attr_accessor :items, :name

  def initialize(name, items = [])
    @id = Random.rand(1..1000)
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@name, @items = []]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
