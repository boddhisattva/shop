class Variant
  attr_reader :price, :grams, :full_title

  def initialize(product_title, variant = {})
    @id = variant["id"]
    @title = variant["title"]
    @product_id = variant["product_id"]
    @price = variant["price"].to_f
    @grams = variant["grams"]
    @full_title = product_title + " " + @title
  end

  def self.sort_by_ascending_price(variants)
    variants.sort_by(&:price)
  end

  def self.total_weight(variants)
    variants.collect(&:grams).inject(0, :+)
  end

  def self.total_cost(variants)
    variants.collect(&:price).inject(0, :+)
  end

  def self.get_full_title(variants)
    variants.collect(&:full_title)
  end
end
