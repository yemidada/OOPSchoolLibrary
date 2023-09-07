require_relative '../solver'

describe Solver do
    solver = Solver.new
    context "when calculating factorial" do
    end

    contet "When checking FizzBuzz" do
        it "should return Fizz" do
            multiple_of_3 = 6
            expect(solver.fizzbuzz(multiple_of_3)).to eq('Fizz')
        end

        it "Should return Buzz" do
            multiple_of_5 = 10
            expect(solver.fizzbuzz(multiple_of_5)).to eq('Buzz')
        end

        it "Should return FizzBuzz" do
            common_multiple = 15
            expect(solver.fizzbuzz(common_multiple)).to eq('FizzBuzz')
        end

        it "Should return the number" do
            num = 4
            expect(solver.fizzbuzz(num)).to eq(4)
        end
    end

    context "When reversing a string" do
        it "should take an input string and reverse it" do
            my_str = "name"
            reverse_str = "eman"
            expect(solver.reverse_str(my_str)).to eq(reverse_str)
        end
    end
end