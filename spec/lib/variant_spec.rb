describe Variant do
  describe "#initialize" do
    let(:variant) { Variant.new(8041889923, "Magenta", 2759196675,
                                14.30, 3030, "Heavy Duty Concrete Keyboard") }

    context "Given a Variant with id, title, product_id, price and weight in grams" do
      it "should set the variant related attributes appropriately" do
        expect(variant.price).to eq(14.30)
        expect(variant.grams).to eq(3030)
        expect(variant.full_title).to eq("Heavy Duty Concrete Keyboard Magenta")
      end
    end
  end
end