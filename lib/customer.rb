class Customer
  REQUIRED_PRODUCT_TYPES = ["Keyboard", "Computer"].freeze

  attr_reader :id

  def initialize(name, id)
    @name, @id = name, id
  end
end
