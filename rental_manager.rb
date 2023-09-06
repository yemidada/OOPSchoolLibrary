require './rental'

class RentalManager
  def add_rental(book, person, date)
    Rental.new(book, person, date)
  end
end
