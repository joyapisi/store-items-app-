class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(id, first_name, last_name, items)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_author
    @items << item
    item.author = self
  end
end
