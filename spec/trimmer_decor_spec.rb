require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  person = Person.new(1, 'maximilianus', 25, true)
  capitalized_person = CapitalizeDecorator.new(person)
  trimmed_person = TrimmerDecorator.new(capitalized_person)

  context 'Using the decirator pattern' do
    it 'trims the name to 10 chars' do
      expect(trimmed_person.correct_name).to eq('Maximilian')
    end
  end
end
