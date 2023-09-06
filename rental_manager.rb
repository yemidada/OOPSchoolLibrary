require './rental'
require './book'
require './person'
require 'pry'
require 'json'

class RentalManager

  def load_from_file(people)
    return unless File.exist?('rentals.json')
    json_rentals = File.read('rentals.json') == '' ? [] : File.read('rentals.json')
    # binding.pry
    JSON.parse(json_rentals).map do |rental|
      book = rental['book']
      person = people.find { |per| per.id == rental['person']['id'] }
      add_rental(Book.new(book['title'], book['author']), person, rental['date'])
    end
  end
  
  def add_rental(book, person, date)
    Rental.new(book, person, date)
  end
end
