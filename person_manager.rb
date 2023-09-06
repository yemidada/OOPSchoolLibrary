require './person'
require './teacher'
require './student'
require 'json'

class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def load_from_file
    return unless File.exist?('people.json')

    json_people = File.empty?('people.json') ? [] : File.read('people.json')
    JSON.parse(json_people).map do |person|
      if person['class_name'] == 'Student'
        people.push(Student.new(person['id'], person['name'], person['age'], person['is_permissed']))
      else
        people.push(Teacher.new(person['id'], person['specialization'], person['name'], person['age']))
      end
    end
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
