class Customer
  REQUIRED_PRODUCT_TYPES = %w(Keyboard Computer).freeze

  attr_reader :id

  def initialize(name, id)
    @name = name
    @id = id
  end
end
