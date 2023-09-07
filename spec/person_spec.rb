require_relative '../person'

describe Person do
  let(:person) { Person.new(1, 'John Dada', 30, true) }

  it 'has an ID, name, age, and parent_permission' do
    expect(person.id).to eq(1)
    expect(person.name).to eq('John Dada')
    expect(person.age).to eq(30)
    expect(person.parent_permission).to be(true)
  end

  it 'starts with no rentals' do
    expect(person.rentals).to be_empty
  end

  it 'can add rentals' do
    rental = double('Rental')

    person.add_rental(rental)

    expect(person.rentals).to include(rental)
  end

  it 'correctly checks if the person can use services' do
    expect(person.can_use_services?).to be(true)

    person.age = 15
    person.parent_permission = false
    expect(person.can_use_services?).to be(false)
  end
end
