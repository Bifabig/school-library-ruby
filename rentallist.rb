require_relative 'app'

module RentalList
  def rental_list
    puts 'Enter ID of the person'
    display_all_people
    person_id = gets.chomp.to_i
    rental = @rentals.find { |r| r.person.id == person_id }
    if rental.nil?
      puts "No such person with ID #{person_id}."
      return
    end
    puts 'Rentals: '
    puts "Book: #{rental.book.title}, Date: #{rental.date}"
  end
end
