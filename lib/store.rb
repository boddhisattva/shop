require_relative './product'
require_relative './variant'
require_relative './shopping_cart'

class Store
  BASE_URL = 'shopicruit.myshopify.com'.freeze
  GET_PRODUCTS_API_ENDPOINT = '/products.json'.freeze

  attr_reader :products, :customer

  def initialize(products, customer)
    @products = initialize_products(products)
    @customer = customer
  end

  def generate_shopping_list
    if products.any?
      keyboard_variants, computer_variants = get_product_variants
      if keyboard_variants.any? && computer_variants.any?
        keyboard_variants = Variant.sort_by_ascending_price(keyboard_variants)
        computer_variants = Variant.sort_by_ascending_price(computer_variants)
        cart = add_to_cart(keyboard_variants, computer_variants)
        display_shopping_list(cart)
      end
    end
  end

  private

    def initialize_products(products)
      products.each_with_object([]) do |product, items|
        items << Product.new(product["id"], product["title"], product["product_type"], product["variants"])
      end
    end

    def get_product_variants
      keyboards = Product.filter_by_type(products, Customer::REQUIRED_PRODUCT_TYPES[0])
      computers = Product.filter_by_type(products, Customer::REQUIRED_PRODUCT_TYPES[1])
      keyboard_variants = Product.collect_variants(keyboards)
      computer_variants = Product.collect_variants(computers)
      [keyboard_variants, computer_variants]
    end

    def add_to_cart(type_a_variants, type_b_variants)
      lesser_variants_product, more_variants_product = arrange_items_by_variants_count(type_a_variants, type_b_variants)
      cart_items = get_equal_number_of_items(lesser_variants_product, more_variants_product)
      ShoppingCart.new(cart_items, customer.id)
    end

    def get_equal_number_of_items(lesser_variants_product, more_variants_product)
      cart_items = []
      count = 0
      lesser_variants_product_count = lesser_variants_product.count - 1

      while count <= lesser_variants_product_count
        cart_items << lesser_variants_product[count]
        cart_items << more_variants_product[count]
        count += 1
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

    def display_shopping_list(cart)
      puts "Items purchased - \n\n"
      cart.items_title.each.with_index(1) do |item_title, index|
        puts "#{index}. #{item_title}"
      end
      puts "\nTotal cost of items - $#{cart.total_cost}"
      puts "\nTotal weight of products - #{cart.total_weight} grams"
    end
end
