require './rental'

class RentalManager
  def initialize

  end
  
  def add_rental(book, person, date)
    Rental.new(book, person, date)
  end
end