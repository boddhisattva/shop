require 'net/http'
require 'json'

require_relative '../lib/store.rb'

STORE_BASE_URL = 'shopicruit.myshopify.com'
GET_PRODUCTS_API_ENDPOINT = '/products.json'

page_number = 1
products = []

products_json_data = Net::HTTP.get(STORE_BASE_URL, GET_PRODUCTS_API_ENDPOINT + "?page=#{page_number}")
products_parsed_json_data = JSON.parse(products_json_data)
products.concat(products_parsed_json_data["products"])

until products_parsed_json_data["products"].empty?
  page_number += 1
  products_json_data = Net::HTTP.get(STORE_BASE_URL, GET_PRODUCTS_API_ENDPOINT + "?page=#{page_number}")
  products_parsed_json_data = JSON.parse(products_json_data)
  products.concat(products_parsed_json_data["products"])
end

if products.count > 0
  store = Store.new(products)
else
  puts "There aren't any products currently at the store"
end
