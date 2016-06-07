class ShoppingCart
  attr_reader :items

  def initialize(items, customer_id)
    @items = items
    @customer_id = customer_id
  end

  def total_weight
    items.collect(&:grams).inject(0, :+)
  end

  def total_cost
    Variant.total_cost(items).round(2)
  end

  def items_title
    items.map(&:full_title)
  end
end
