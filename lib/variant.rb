class Variant
  attr_reader :id, :title, :product_id, :price, :grams

  def initialize(id, title, product_id, price, grams)
    @id, @title, @product_id = id, title, product_id
    @price, @grams =  price.to_f, grams
  end
end
