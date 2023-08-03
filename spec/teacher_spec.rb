require './teacher'

describe Teacher do
  context 'when testing teacher class' do
    before :all do
      @teacher = Teacher.new('Biology', 55, 'Taye G.')
    end

    it 'should have age, name, specialization, parent_permission, rentals' do
      expect(@teacher).to have_attributes(age: 55)
      expect(@teacher).to have_attributes(name: 'Taye G.')
      expect(@teacher).to have_attributes(specialization: 'Biology')
      expect(@teacher.rentals).to be_empty
    end
    it 'should return true when can_use_service? is called' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
