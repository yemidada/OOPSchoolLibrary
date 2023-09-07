require_relative '../classroom'

describe Classroom do
  it "has a label" do
    classroom = Classroom.new("Class Five")
    expect(classroom.label).to eq("Class Five")
  end

  it "can add student" do
    classroom = Classroom.new("Class two")
    student = double("Student")
    classroom.add_student(student)
    expect(classroom.students).to include(student)
  end
end