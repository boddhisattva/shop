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
end
