require_relative 'app'

module RentalList
  def rental_list
    puts 'Enter ID of the person'
    display_all_people
    person_id = gets.chomp.to_i
    person = @people.find { |person| person.id == person_id }
    if person.nil?
      puts "No such person with ID #{person_id}."
      return
    end
    puts 'Rentals: '
    person.rentals.each_with_index do |rental, index|
      puts "#{index + 1}) Book: #{rental.book.title}, Date: #{rental.date}"
    end

    # puts "Rentals for person #{person.name}:"
    # person.rentals.each do |rental|
    #   puts "Date: #{rental.date}, Book: #{rental.book.title}"
    # end
  end
end