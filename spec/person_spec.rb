require_relative '../person'

describe Person do
  let(:person) { Person.new(1, 'John Dada', 30, true) }
  context 'When creating a person' do
    it 'it should have an ID, name, age, and parent_permission' do
      expect(person.id).to eq(1)
      expect(person.name).to eq('John Dada')
      expect(person.age).to eq(30)
      expect(person.parent_permission).to be(true)
    end
  end

  context 'When working with rentals' do
    it 'starts with no rentals' do
      expect(person.rentals).to be_empty
    end

    it 'can add rentals' do
      rental = double('Rental')

      person.add_rental(rental)

      expect(person.rentals).to include(rental)
    end
  end

  context 'When checking person permissions' do
    it 'correctly checks if the person can use services' do
      expect(person.can_use_services?).to be(true)

      person.age = 15
      person.parent_permission = false
      expect(person.can_use_services?).to be(false)
    end
  end
end
