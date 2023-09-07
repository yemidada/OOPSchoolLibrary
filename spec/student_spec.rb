require_relative '../student'

describe Student do
  it 'should have the same properties' do
    student = Student.new(1, 17, 'Myself', false)
    expect(student.id).to eq(1)
    expect(student.name).to eq('Myself')
  end
end
