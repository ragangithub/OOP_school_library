require 'spec_helper'

describe Person do
  context 'When testing the person class' do
    age = 25
    name = 'person'
    person = Person.new(age, name)

    it 'should validate the age of the person' do
      expect(person.age).to eq age
    end

    it 'should validate the name of the person' do
      expect(person.name).to eq name
    end

    it 'should return true when we call the can_use_services? method' do
      expect(person.can_use_services?).to eq true
    end

    it 'should return true when > 18 and no parent permission' do
      new_student = Person.new(18, name, parent_permission: false)
      expect(new_student.can_use_services?).to eq true
    end

    it 'should return false when age 18 and no parent permission' do
      new_student = Person.new(13, name, parent_permission: true)
      expect(new_student.can_use_services?).to eq true
    end

    it 'add a rental' do
      book = Book.new('Title', 'Author')
      new_student = Person.new(13, name, parent_permission: true)
      expect(new_student.rentals.length).to eql(0)
      new_student.add_rental('2022-03-26', book)
      expect(new_student.rentals.length).to eql(1)
    end
  end
end
