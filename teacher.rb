require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'specialization' => @specialization,
      'age' => @age,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    teacher = new(object['specialization'], object['age'], object['name'])
    teacher.instance_variable_set(:@id, object['id'])
    teacher
  end
end
