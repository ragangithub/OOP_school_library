class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name, age, parent_permission: true)
    @id = rand(1_000_000_000)
    @name = name || 'Unknown'
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end


  private


  def of_age?
    age >= 18
  end
end
