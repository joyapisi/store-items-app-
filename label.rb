class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_label(book)
    @items << book
  end

  def add_item(item)
    @items << item
    item.add_label = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [title, color]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
