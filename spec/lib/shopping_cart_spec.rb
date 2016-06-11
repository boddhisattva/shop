describe ShoppingCart do
  let(:items) do
    [Variant.new("Heavy Duty Concrete Keyboard", "id" => 8041889923, "title" => "Magenta",
                                                 "product_id" => 2759196675, "price" => "14.30", "grams" => 3030),
     Variant.new("Aerodynamic Cotton Keyboard", "id" => 7045889239, "title" => "Cyan",
                                                "product_id" => 2759196675, "price" => "6", "grams" => 2730)]
  end

  describe "#initialize" do
    context "Given a Shopping Cart with items and a customer id" do
      it "should set the shopping cart related attributes appropriately" do
        shopping_cart = ShoppingCart.new(items, 1)

        expect(shopping_cart.items.count).to eq(2)
      end
    end
  end

  describe "#total_weight" do
    context "Given a Shopping Cart with some items" do
      it "should calculate the total weight related to those items" do
        shopping_cart = ShoppingCart.new(items, 1)

        expect(shopping_cart.total_weight).to eq(5760)
      end
    end
  end

  describe "#total_cost" do
    context "Given a Shopping Cart with some items" do
      it "should calculate the total cost related to those items" do
        shopping_cart = ShoppingCart.new(items, 1)

        expect(shopping_cart.total_cost).to eq(20.30)
      end
    end
  end

  describe "#items_title" do
    context "Given a Shopping Cart with some items" do
      it "should return full titles of all the items" do
        shopping_cart = ShoppingCart.new(items, 1)

        expect(shopping_cart.items_title).to eq(["Heavy Duty Concrete Keyboard Magenta",
                                                 "Aerodynamic Cotton Keyboard Cyan"])
      end
    end
  end
end
