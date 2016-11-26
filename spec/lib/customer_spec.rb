require_relative '../../lib/customer'

def assert(conditions) raise "Fail" unless conditions ; end

# describe Customer do
#   describe "#initialize" do
#     describe "Given a Customer with name and id" do
#       it "should set the Customer related attributes appropriately" do
#         customer = Customer.new("Alice", 1)

#         # expect(customer.id).to eq(1)
#       end
#     end
#   end
# end

def test_initialize
  customer = Customer.new("Alice", 1)

  assert(customer.id == 1)
end

test_initialize