require_relative '../solver'

describe Solver do
    solver = Solver.new
    context "when calculating factorial" do
    end

    contet "When checking FizzBuzz" do
    end

    context "When reversing a string" do
        it "should take an input string and reverse it" do
            my_str = "name"
            reverse_str = "eman"
            expect(solver.reverse_str(my_str)).to eq(reverse_str)
        end
    end
end