describe ShoppingCart do
  let(:products) { [Variant.new(8041889923, "Magenta", 2759196675,
                                14.30, 3030, "Heavy Duty Concrete Keyboard"),
                    Variant.new(7045889239, "Cyan", 2759196675,
                                6, 2730, "Aerodynamic Cotton Keyboard")] }

  describe "#initialize" do
    context "Given a Shopping Cart with products and a customer id" do
      it "should set the Shopping Cart related attributes appropriately" do
        shopping_cart = ShoppingCart.new(products, 1)

        expect(shopping_cart.products.map(&:grams)).to match_array([3030, 2730])
      end
    end
  end

  describe "#total_weight" do
    context "Given a Shopping Cart with some products" do
      it "should calculate the total weight related to those products" do
        shopping_cart = ShoppingCart.new(products, 1)

        expect(shopping_cart.total_weight).to eq(5760)
      end
    end
  end

  describe "#total_cost" do
    context "Given a Shopping Cart with some products" do
      it "should calculate the total cost related to those products" do
        shopping_cart = ShoppingCart.new(products, 1)

        expect(shopping_cart.total_cost).to eq(20.30)
      end
    end
  end
end
