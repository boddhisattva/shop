class Customer

  REQUIRED_PRODUCT_TYPES = ["Keyboard", "Computer"]

  attr_reader :id

  def initialize(name, id)
    @name, @id = name, id
  end
end
