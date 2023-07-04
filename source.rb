class Source
  attr_reader :id, :name
  attr_accessor :items

  def initialize(name, items)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_source
    @items << item
    item.source = self
  end
end
