class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date

    book.add_rental(person, date)
    person.add_rental(book, date)
  end
end
