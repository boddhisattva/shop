class ShoppingCart
  attr_reader :products

  def initialize(products, customer_id)
    @products = products
    @customer_id = customer_id
  end

  def total_weight
    products.collect(&:grams).inject(0, :+)
  end

  def total_cost
    products.collect(&:price).inject(0, :+)
  end
end
