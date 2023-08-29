require './nameable.rb'
require './capitalizeDecorator.rb'
require './trimmerDecorator.rb'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(id, name = 'Unknown', age = 0, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end



person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name