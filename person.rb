require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name, parent_permission: true)
    super()
    @id = rand(1_000_000_000)
    @name = name || 'Unknown'
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def to_json(*_args)
    {
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    Person.new(data['age'], data['name'], parent_permission: data['parent_permission'])
  end

  private

  def of_age?
    age >= 18
  end
end
