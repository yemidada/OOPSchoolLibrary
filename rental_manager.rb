require './rental'
require './book'
require './person'
require 'pry'
require 'json'

class RentalManager

  def load_from_file
    return unless File.exist?('rentals.json')
    json_rentals = File.read('rentals.json') == '' ? [] : File.read('rentals.json')
    # binding.pry
    JSON.parse(json_rentals).map do |rental|
      book = rental['book']
      person = rental['person']
      if person['class_name'] == 'student'
        add_rental(Book.new(book['title'], book['author']), Student.new(person['id'], person['name'], person['age'], person['is_permissed']), rental['date'])
      else
        add_rental(Book.new(book['title'], book['author']), Teacher.new(person['id'], person['specialization'], person['name'], person['age']), rental['date'])
      end
    end
  end
  
  def add_rental(book, person, date)
    Rental.new(book, person, date)
  end
end
