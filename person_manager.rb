require './person'
require './teacher'
require './student'

class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def add_person(type, name, age)
    id = Time.now.to_i

    case type
    when '1'
      puts 'Has parent permission? [Y/N]:'
      permission = gets.chomp
      is_permissed = permission.downcase == 'y'
      people.push(Student.new(id, name, age, is_permissed))
    when '2'
      puts 'Specialization:'
      specialization = gets.chomp
      people.push(Teacher.new(id, specialization, name, age))
    end
  end
    
  def list_people
    people.each do |person|
      puts "[#{person.class.name}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
  end
end