require_relative './product'
require_relative './variant'

class Store

  attr_reader :products

  def initialize(products)
    @products = get_products(products)
  end

private

  def get_products(products)
    products.each_with_object([]) do |product, items|
      items << Product.new(product["id"], product["title"], product["variants"])
    end
  end
end
