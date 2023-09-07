require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'
require_relative '../decorator'

describe CapitalizeDecorator do
    person = Person.new(1, 'myself', 25, true)
    capitalized_person = CapitalizeDecorator.new(person)
    it 'Should capitalize the name' do
        expect(capitalized_person.correct_name).to eq('Myself')
    end
end

describe TrimmerDecorator do
    person = Person.new(1, 'maximilianus', 25, true)
    capitalized_person = CapitalizeDecorator.new(person)
    trimmed_person = TrimmerDecorator.new(capitalized_person)
    it '' do
        expect(trimmed_person.correct_name).to eq('Maximilian')
    end
end