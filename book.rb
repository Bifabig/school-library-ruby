require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    book = new(object['title'], object['author'])
    book.instance_variable_set(:@id, object['id'])
    book
  end
end
