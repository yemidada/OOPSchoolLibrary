class Person
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(id, name = 'Unknown', age = 0, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    @age >= 18 || @parent_permission
  end
end