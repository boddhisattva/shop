describe Customer do
  describe "#initialize" do
    context "Given a Customer with name and id" do
      it "should set the Customer related attributes appropriately" do
        customer = Customer.new("Alice", 1)

        expect(customer.id).to eq(1)
      end
    end
  end
end
