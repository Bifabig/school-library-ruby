require_relative '../person'
require_relative '../book'
require_relative '../rental'

RSpec.describe Person do
  let(:name) { 'Biftu G' }
  let(:age) { 28 }
  let(:parent_permission) { true }
  let(:person) { Person.new(age, name, parent_permission: parent_permission) }

  describe '#new' do
    it 'creates a new person object with the correct attributes' do
      expect(person).to be_a(Person)
      expect(person.name).to eq(name)
      expect(person.age).to eq(age)
      expect(person.parent_permission).to eq(parent_permission)
      expect(person.rentals).to be_an(Array)
    end
  end

  describe '#can_use_service?' do
    it 'returns true if the person has parent permission or is of age' do
      expect(person.can_use_services?).to eq(true)
    end

    it "returns false if the person is not of age and doesn't have parent permission" do
      person = Person.new(11, 'Peter A.', parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#add_rental' do
    it "adds a rental to the person's rentals array" do
      book = Book.new('Harry Potter', 'J. K. Rowling')
      rental = Rental.new('2023/08/03', book, person)
      person.rentals << rental

      expect(person.rentals).to include(rental)
    end
  end
end
