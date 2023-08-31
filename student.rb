require './person'

class Student < Person
  attr_reader :classroom

  def initialize(id, name = 'Unknown', age = 0, parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom&.students&.push(self)
  end
end
