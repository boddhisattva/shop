describe Variant do
  describe "#initialize" do
    let(:variant) { Variant.new(8041889923, "Magenta", 2759196675, 14.30, 3030) }

    context "Given a Variant with id, title, product_id, price and weight in grams" do
      it "should set the variant related attributes appropriately" do
        expect(variant.id).to eq(8041889923)
        expect(variant.title).to eq("Magenta")
        expect(variant.product_id).to eq(2759196675)
        expect(variant.price).to eq(14.30)
        expect(variant.grams).to eq(3030)
      end
    end
  end
end
