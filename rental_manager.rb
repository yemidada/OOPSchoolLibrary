require './rental'
require './book'
require './person'
require 'pry'

class RentalManager

  def load_from_file
    return unless File.exist?('rentals.json')
    json_rentals = File.read('rentals.json') == '' ? [] : File.read('rentals.json')
    puts json_rentals
    # binding.pry
    json_rentals.each do |rental|
      Rental.new(rental['book'], rental['person'], rental['date'])
    end
  end
  
  def add_rental(book, person, date)
    Rental.new(book, person, date)
  end
end
