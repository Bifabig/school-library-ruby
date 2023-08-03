require 'json'
require_relative 'app'
require_relative 'takeinput'

class Main
  def initialize
    @app = App.new
    prompt
  end

  def prompt
    puts 'Welcome to the School Library App!'
    puts 'previous data:'
    people_json
    books_json
    rentals_json

    loop do
      display_options
      option = TakeInput.new.take_input
      @app.run(option)

      break if option == 7
    end
  end

  def display_options
    puts 'Please choose one of the options: '
    puts '1. - List all books'
    puts '2. - List all people'
    puts '3. - Create a person'
    puts '4. - Create a book'
    puts '5. - Create a rental'
    puts '6. - List all rentals for a given person ID'
    puts '7. - Exit'
  end

  def people_json
    return unless File.exist?('people.json')

    file = File.read('./people.json')
    @app.people = JSON.parse(file, create_additions: true)
    @app.people.each_with_index do |people, index|
      puts "person #{index + 1}) Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end

  def books_json
    return unless File.exist?('books.json')

    file = File.read('./books.json')
    @app.books = JSON.parse(file, create_additions: true)
    @app.books.each_with_index do |book, index|
      puts "book #{index + 1}) Title: '#{book.title}', Author: '#{book.author}'"
    end
  end

  def rentals_json
    return unless File.exist?('rentals.json')

    file = File.read('./rentals.json')
    @app.rentals = JSON.parse(file, create_additions: true)
    @app.rentals.each_with_index do |rental, index|
      puts "rental #{index + 1}) Date: '#{rental.date}',"
      puts "          Book: '#{rental.book.title}' by '#{rental.book.author}',"
      puts "          Rented by: '#{rental.person.name}'"
    end
  end
end

Main.new
