require_relative 'app'

module RentalList
  def rental_list
    puts 'Enter ID of the person'
    display_all_people
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "No such person with ID #{person_id}."
      return
    end
    puts 'Rentals: '
    person.rentals.each_with_index do |rental, index|
      puts "#{index + 1}) Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end
end
