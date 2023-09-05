class UserInterface
  attr_reader :book_manager, :person_manager, :rental_manager

  def initialize(book_manager, person_manager, rental_manager)
    @book_manager = book_manager
    @person_manager = person_manager
    @rental_manager = rental_manager
  end

  def run
    list_of_question = on_questions;
    on_question_answer(list_of_question)
    run
  end

  def get_user_input
    puts '-------------------------------------------'
    puts "Welcome to School Library Application!\n\n"
    puts "Please choose an opinion by entering a number!\n"
    puts '1 - List of books'
    puts '2 - List of people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person'
    puts "7 - Exit\n\n"
    gets.chomp
  end

  def handle_user_choice(selected_option)
    case selected_option
    when '1'
      book_manager.list_books
    when '2'
      person_manager.list_people
    when '3'
      add_person
    when '4'
      add_book
    when '5'
      add_rental
    when '6'
      on_list_rental_by_person
    else
      abort('bye! Thank you for using this application')
    end
  end

  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    type = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    person_manager.add_person(type, age, name)

    puts 'Person created successfully'
  end

  def add_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book_manager.add_book(author, title)

    puts 'Book created successfully'
  end

  def add_rental
    puts 'Please select a book from your following list by number'

    book_manager.books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: '#{book.author}' "
    end
    book_index = gets.chomp

    puts 'Please select a person from your following list by number'

    person_manager.people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
    person_index = gets.chomp

    puts 'Date:'
    date = gets.chomp


    rental_manager.add_rental(book_manager.books[book_index.to_i], person_manager.people[person_index.to_i], date)

    puts 'Rental created successfully'
  end

  def on_list_rental_by_person
    puts 'ID of the person'
    id = gets.chomp

    person = person_manager.people.find { |item| item.id == id.to_i }
    person.rentals.each do |per|
      puts "[#{per.date}] Book: #{per.book.title} by #{per.book.author}"
    end
  end
end