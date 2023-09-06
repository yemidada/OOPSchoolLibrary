require './rental'
require './book'
require './person'

class RentalManager

  def load_from_file
    json_rentals = File.open('rentals.json') do |file|
      defined?(file.read) ? JSON.parse(file.read) : []
    end
    json_rentals.each do |rental|
      
      Rental.new(rental['book'], rental['person'], rental['date'])
    end
  end
  
  def add_rental(book, person, date)
    Rental.new(book, person, date)
  end
end
