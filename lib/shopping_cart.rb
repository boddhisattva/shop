class ShoppingCart
  attr_reader :items

  def initialize(items, customer_id)
    @items = items
    @customer_id = customer_id
  end

  def total_weight
    Variant.total_weight(items)
  end

  def total_cost
    Variant.total_cost(items).round(2)
  end

  def items_title
    Variant.get_full_title(items)
  end
end
