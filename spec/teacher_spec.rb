require_relative '../teacher'

describe Teacher do
  context 'Creating a new Teacher' do
    it 'should have the same properties' do
      teacher = Teacher.new(1, 'Time', 'Myself', 35)
      expect(teacher.id).to eq(1)
      expect(teacher.name).to eq('Myself')
    end
  end
end
