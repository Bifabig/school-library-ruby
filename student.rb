require_relative 'person'

class Student < Person
  attr_accessor :parent_permission
  attr_reader :classroom, :title

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'classroom' => @classroom.label,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    classroom = Classroom.new(object['classroom'])
    student = new(classroom, object['age'], object['name'], parent_permission: object['parent_permission'])
    student.instance_variable_set(:@id, object['id'])
    student
  end
end
