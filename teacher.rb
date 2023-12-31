require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, specialization, name, age, parent_permission: false)
    super(id, name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
