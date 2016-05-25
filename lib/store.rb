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
    keyboards, computers = get_product_variants
    keyboards = sort_by_ascending_price(keyboards)
    computers = sort_by_ascending_price(computers)
    cart = add_to_cart(keyboards, computers)
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

  def add_to_cart(keyboards, computers)
    cart_items = get_equal_number_of_items(keyboards, computers)
    cart = ShoppingCart.new(cart_items, customer.id)
  end

  def get_equal_number_of_items(keyboards, computers)
    total_cost, cart_items = 0, []

    keyboards.each_with_index do |keyboard, index|
      total_cost += keyboard.price + computers[index].price
      if cost_within_customer_budget?(total_cost)
        cart_items << keyboard
        cart_items << computers[index]
      end
    end

    cart_items
  end

  def cost_within_customer_budget?(total_cost)
    if customer.budget
      total_cost <= customer.budget
    else
      raise "Please specify customer budget to proceed with current transaction"
    end
  end

  def display_list(cart)
    puts cart.products.map(&:full_title)
    puts "Total cost of items - $#{cart.total_cost}"
    puts "Total weight of products in grams - #{cart.total_weight}"
  end
end
