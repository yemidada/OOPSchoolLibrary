require_relative '../rental'
describe Rental do
    let(:rental) { 
        person = Person.new(1, 'John Dada', 30, true)
        book = Book.new("How to make one million in 1 hour", "Mr Money")
        Rental.new(book, person, '2022-01-01') 
    }
  
    it 'has an book, person, and date' do
        person = double("Person")
        book = double("Book")
        rental = Rental.new(book, person, '2022-01-01') 
        expect(rental.book).to eq(book)
        expect(rental.person).to eq(person)
    end
end