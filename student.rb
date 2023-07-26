require './person'

class Student < Person
  attr_reader :classroom


  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  #   Create the belongs-to side (a student belongs to a classroom).
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
