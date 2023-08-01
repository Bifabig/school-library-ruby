require_relative 'app'
require_relative 'teacher'

module CreateTeacher
  def create_teacher(name, age, specialization)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
  end
end
