require 'date'

class Item
  attr_reader :id, :publish_date
  attr_accessor :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    publish_date < (Date.today - (10 * 365))
  end

  def move_to_archive
    self.archived = can_be_archived?
  end
end
