class Variant
  attr_reader :price, :grams, :full_title

  def initialize(product_title, variant = {})
    @id, @title, @product_id = variant["id"], variant["title"], variant["product_id"]
    @price, @grams = variant["price"].to_f, variant["grams"]
    @full_title = product_title + " " + @title
  end
end
