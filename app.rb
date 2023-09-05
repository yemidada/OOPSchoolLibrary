require './book_manager'
require './person_manager'
require './rental_manager'
require './user_interface'

class App
  def initialize
    @book_manager = BookManager.new
    @person_manager = PersonManager.new
    @rental_manager = RentalManager.new
    @user_interface = UserInterface.new(@book_manager, @person_manager, @rental_manager)
  end
  
  def run
    on_question_answer(on_questions)
    run
  end
  
  def on_list_books
    @book_manager.list_books
  end
  
  def on_list_people
      @person_manager.list_people
  end
  
  def add_person
    @person_manager.add_person
  end
  
  def add_book
    @book_manager.add_book
  end
  
  def add_rental
    @rental_manager.add_rental
  end
  
  def on_list_rental_by_person
    @person_manager.list_rentals_by_person
  end
  
  def on_questions
      @user_interface.get_user_input
  end
  
  def on_question_answer(selected_option)
      @user_interface.handle_user_choice(selected_option)
  end
end
  