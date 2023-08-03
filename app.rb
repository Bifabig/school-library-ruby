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
require_relative 'preservedata'

class App
  attr_accessor :books, :stundents, :teachers, :rental, :people, :rentals

  include CreatePerson
  include CreateStudent
  include CreateTeacher
  include CreateBook
  include CreateRental
  include DisplayPeople
  include DisplayBooks
  include RentalList
  include PreserveData

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run(option)
    case option
    when 1
      display_all_books
    when 2
      display_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rental_list
    else
      preserve_data
      puts 'Thank you for using this app!'
      exit
    end
  end
end
