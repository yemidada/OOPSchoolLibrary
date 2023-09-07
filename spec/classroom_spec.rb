require_relative '../classroom'

describe Classroom do
  context 'When creating a simple classroom' do
    it 'should have a label' do
      classroom = Classroom.new('Class Five')
      expect(classroom.label).to eq('Class Five')
    end
  end
  context 'When willing to add a student' do
    it 'should add student' do
      classroom = Classroom.new('Class two')
      student = double('Student')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
