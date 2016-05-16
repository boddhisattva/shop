class Variant
  attr_reader :id, :title, :product_id, :price, :grams, :full_title

  def initialize(id, title, product_id, price, grams, product_title)
    @id, @title, @product_id = id, title, product_id
    @price, @grams =  price.to_f, grams
    @full_title = product_title.concat(" ").concat(title)
  end
end
