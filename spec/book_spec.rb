require_relative '../book'

describe Book do
  context 'When you create a instance of the book' do
    it 'has a title and author' do
      book = Book.new('How to make one million in 1 hour', 'Mr Money')
      expect(book.title).to eq('How to make one million in 1 hour')
      expect(book.author).to eq('Mr Money')
    end
  end

  context 'when you want a rental' do
    it 'can add rentals' do
      book = Book.new('How to make one million in 1 hour', 'Mr Money')
      rental = double('Rental')
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
