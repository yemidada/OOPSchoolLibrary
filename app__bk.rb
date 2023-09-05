require './person'
require './teacher'
require './student'
require './rental'
require './book'

require './interface/user_interface'

class App < UserInterface
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
  end

  def run
    on_question_answer(on_questions)
    run
  end

  def on_list_books
    books.each do |book|
      puts "Title: '#{book.title}', Author: '#{book.author}'"
    end
  end

  def on_list_people
    people.each do |person|
      puts "[#{person.class.name}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
  end

  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    type = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp

    add_person_general(type, age, name)

    puts 'Person created successfully'
  end

  def add_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    books.push(Book.new(title, author))

    puts 'Book created successfully'
  end

  def add_rental
    puts 'Please select a book from your following list by number'

    books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: '#{book.author}' "
    end
    selected_book = gets.chomp

    puts 'Please select a person from your following list by number'

    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
    selected_person = gets.chomp

    puts 'Date:'
    date = gets.chomp
    Rental.new(books[selected_book.to_i], people[selected_person.to_i], date)

    puts 'Rental created successfully'
  end

  def on_list_rental_by_person
    puts 'ID of the person'
    id = gets.chomp

    person = people.find { |item| item.id == id.to_i }
    person.rentals.each do |per|
      puts "[#{per.date}] Book: #{per.book.title} by #{per.book.author}"
    end
  end

  def on_questions
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

  def on_question_answer(selected_option)
    case selected_option
    when '1'
      on_list_books
    when '2'
      on_list_people
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

  def add_person_general(create_person, age, name)
    id = Time.now.to_i

    case create_person
    when '1'
      puts 'Has parent permission? [Y/N]:'
      permission = gets.chomp
      is_permissed = permission.downcase == 'y'
      people.push(Student.new(id, name, age, is_permissed))
    when '2'
      puts 'Specialization:'
      specialization = gets.chomp
      people.push(Teacher.new(id, specialization, name, age))
    end
  end
end
