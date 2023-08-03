require_relative '../student'
require_relative '../classroom'

describe Student do
  before :all do
    @classroom = Classroom.new('9F')
    @student = Student.new(@classroom, 15, 'Bifa G.', parent_permission: false)
  end

  describe '#new' do
    it 'takes 4 parameters and returns a student object' do
      expect(@student).to be_an_instance_of(Student)
    end
  end

  describe '#classroom' do
    it 'takes one parameter and adds the student to students array of classroom object' do
      @student.classroom = @classroom
      expect(@student.classroom.students.length).to eq(1)
    end
  end

  describe '#play_hooky' do
    it 'play_hooky method should return an emoji' do
      expect(@student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
