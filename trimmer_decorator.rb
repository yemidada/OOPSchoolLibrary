require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name_variable = @nameable.correct_name
    if namname_variablee.length > 10
      name_variable[0, 10]
    else
      name_variable
    end
  end
end
