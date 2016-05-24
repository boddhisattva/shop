class Customer

  REQUIRED_PRODUCT_TYPES = ["Keyboard", "Computer"]

  attr_reader :budget, :id

  def initialize(name, id, budget = nil)
    @name, @id, @budget = name, id, budget
  end
end
