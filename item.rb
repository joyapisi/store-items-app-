require 'date'

class Item
  attr_reader :id, :genre, :author, :label, :archived, :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    year = Time.new.year
    year - @publish_date.year > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def add_genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end
