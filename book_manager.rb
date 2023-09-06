require './book'
require 'pry'
class BookManager
  attr_reader :books

  def initialize
    @books = []
  end

  def load_from_file
    return unless File.exist?('books.json')
    json_books = File.read('books.json') == "" ? [] : File.read('books.json')
    json_books.each do |book|
      books.push(Book.new(book['title'], book['author']))
    end
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
