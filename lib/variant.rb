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

  def self.sort_by_ascending_price(product_variants)
    product_variants.sort_by(&:price)
  end
end
