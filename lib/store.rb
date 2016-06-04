require_relative './product'
require_relative './variant'
require_relative './shopping_cart'

class Store

  BASE_URL = 'shopicruit.myshopify.com'
  GET_PRODUCTS_API_ENDPOINT = '/products.json'

  attr_reader :products, :customer

  def initialize(products, customer)
    @products = get_products(products)
    @customer = customer
  end

  def generate_shopping_list
    keyboard_variants, computer_variants = get_product_variants
    keyboard_variants = sort_by_ascending_price(keyboard_variants)
    computer_variants = sort_by_ascending_price(computer_variants)
    cart = add_to_cart(keyboard_variants, computer_variants)
    display_list(cart)
  end

private

  def get_products(products)
    products.each_with_object([]) do |product, items|
      items << Product.new(product["id"], product["title"], product["product_type"], product["variants"])
    end
  end

  def get_product_variants
    keyboards = filter_products_by_type(Customer::REQUIRED_PRODUCT_TYPES[0])
    computers = filter_products_by_type(Customer::REQUIRED_PRODUCT_TYPES[1])
    keyboard_variants = keyboards.collect(&:variants).flatten
    computer_variants = computers.collect(&:variants).flatten
    return keyboard_variants, computer_variants
  end

  def filter_products_by_type(type)
    products.select {|product| product.product_type == type}
  end

  def sort_by_ascending_price(products)
    products.sort_by(&:price)
  end

  def add_to_cart(type_a_variants, type_b_variants)
    cart_items = get_equal_number_of_items(type_a_variants, type_b_variants)
    cart = ShoppingCart.new(cart_items, customer.id)
  end

  def get_equal_number_of_items(type_a_variants, type_b_variants)
    cart_items, count = [], 1
    lesser_variants_product, more_variants_product = arrange_items_by_variants_count(type_a_variants, type_b_variants)

    while count <= lesser_variants_product.count
      lesser_variants_product.each_with_index do |variant, index|
        cart_items << variant
        cart_items << more_variants_product[index]
        count += 1
      end
    end

    cart_items
  end

  def arrange_items_by_variants_count(type_a_variants, type_b_variants)
    if type_a_variants.count <= type_b_variants.count
      return type_a_variants, type_b_variants
    else
      return type_b_variants, type_a_variants
    end
  end

  def display_list(cart)
    puts cart.products_title
    puts "Total cost of items - $#{cart.total_cost}"
    puts "Total weight of products in grams - #{cart.total_weight}"
  end
end
