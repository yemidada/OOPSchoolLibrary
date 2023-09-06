require './book'
class BookManager
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book(title, author)
    books.push(Book.new(title, author))
  end

  def list_books
    books.each do |book|
      puts "Title: '#{book.title}', Author: '#{book.author}'"
    end
  end
end
