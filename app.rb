require_relative 'book'
require_relative 'rental'
require_relative 'classroom'
require_relative 'createperson'
require_relative 'createstudent'
require_relative 'createteacher'
require_relative 'createbook'
require_relative 'createrental'
require_relative 'displaybooks'
require_relative 'displaypeople'
require_relative 'rentallist'


class App
  attr_accessor :books, :stundents, :teachers, :rental

  include CreatePerson
  include CreateStudent
  include CreateTeacher
  include CreateBook
  include CreateRental
  include DisplayPeople
  include DisplayBooks
  include RentalList

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

    def run
    prompt
  end
end
