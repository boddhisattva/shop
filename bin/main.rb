require 'net/http'
require 'json'

require_relative '../lib/store'
require_relative '../lib/customer'
require_relative '../lib/api'

STARTING_PAGE_NUMBER = 1

def get_initial_set_of_products
  products = []
  products_json_data = query_resource(STARTING_PAGE_NUMBER)
  unless products_json_data.empty?
    products_parsed_json_data = parse_json(products_json_data)
    products.concat(products_parsed_json_data["products"])
    get_remaining_products_from_other_pages(products, STARTING_PAGE_NUMBER, products_parsed_json_data)
  end
end

def get_remaining_products_from_other_pages(products, page_number, products_parsed_json_data)
  while more_products_are_present?(products_parsed_json_data)
    page_number += 1
    products_json_data = query_resource(page_number)
    products_parsed_json_data = parse_json(products_json_data)
    products.concat(products_parsed_json_data["products"])
  end

  products
end

def query_resource(page_number)
  Net::HTTP.get(Store::BASE_URL, Store::GET_PRODUCTS_API_ENDPOINT + "?page=#{page_number}")
end

def parse_json(data)
  JSON.parse(data)
end

def more_products_are_present?(products_parsed_json_data)
  products_parsed_json_data["products"].any?
end

products = get_initial_set_of_products

if products.count > 0
  customer = Customer.new('Alice', 1)
  store = Store.new(products, customer)
  store.generate_shopping_list
else
  puts "There aren't any products currently at the store"
end
