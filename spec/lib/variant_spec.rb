describe Variant do
  describe "#initialize" do
    let(:product_title) { "Heavy Duty Concrete Keyboard" }
    let(:variant) { Variant.new(product_title, "id" => 8041889923, "title" => "Magenta",
                                "product_id" => 2759196675, "price" => "14.30", "grams" => 3030) }

    context "Given a Variant with id, title, product_id, price and weight in grams" do
      it "should set the variant related attributes appropriately" do
        expect(variant.price).to eq(14.30)
        expect(variant.grams).to eq(3030)
        expect(variant.full_title).to eq("Heavy Duty Concrete Keyboard Magenta")
      end
    end
  end
end
