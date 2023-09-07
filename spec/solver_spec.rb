require_relative '../solver'

describe Solver do
  solver = Solver.new
  context 'when calculating factorial' do
    it 'Should return 1' do
      expect(solver.factorial(0)).to eq(1)
    end

    it 'should return the real answer' do
      num = 5
      expect(solver.factorial(num)).to eq(120)
    end
  end

  context 'When checking FizzBuzz' do
    it 'should return fizz' do
      multiple_of_three = 6
      expect(solver.fizzbuzz(multiple_of_three)).to eq('fizz')
    end

    it 'Should return fuzz' do
      multiple_of_five = 10
      expect(solver.fizzbuzz(multiple_of_five)).to eq('buzz')
    end

    it 'Should return fizzbuzz' do
      common_multiple = 15
      expect(solver.fizzbuzz(common_multiple)).to eq('fizzbuzz')
    end

    it 'Should return the number' do
      num = 4
      expect(solver.fizzbuzz(num)).to eq('4')
    end
  end

  context 'When reversing a string' do
    it 'should take an input string and reverse it' do
      my_str = 'name'
      reversed_str = 'eman'
      expect(solver.reverse(my_str)).to eq(reversed_str)
    end
  end
end
