class Solver
  def factorial(num)
    'Input must be a non-negative integer' if num.negative?

    1 if num.zero?

    result = 1
    (1..num).each do |i|
      result *= i
    end

    result
  end

  def reverse(char)
    char.reverse
  end

  def fizzbuzz(num)
    if (num % 3).zero? && (num % 5).zero?
      'fizzbuzz'
    elsif (num % 3).zero?
      'fizz'
    elsif (num % 5).zero?
      'buzz'
    else
      num.to_s
    end
  end
end

solver = Solver.new
puts solver.factorial(5)
puts solver.reverse('Hello')
puts solver.fizzbuzz(15)
