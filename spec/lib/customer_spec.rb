describe Customer do
  describe "#initialize" do

    context "Given a Customer with name, id and budget" do
      it "should set the Customer related attributes appropriately" do
        customer = Customer.new("Alice", 1, 1000)

        expect(customer.id).to eq(1)
        expect(customer.budget).to eq(1000)
      end
    end
  end
end
