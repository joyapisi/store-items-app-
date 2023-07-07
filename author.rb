class Author
  attr_reader :id, :first_name, :last_name
  attr_accessor :items

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_item(item)
    @items << item
    item.author = self # Set the author property of the item object
  end
end
