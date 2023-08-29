require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name_var = @nameable.correct_name
    if name_var.length > 10
      name_var[0, 10]
    else
      name_var
    end
  end
end
