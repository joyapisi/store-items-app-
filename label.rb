class Label
  attr_reader :id, :title, :color
  attr_accessor :items

  def initialize(id, title, color, items)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_label
  end
end
