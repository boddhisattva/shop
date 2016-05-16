describe Product do
  describe "#initialize" do
    let(:variants) {[{"id"=>8041889923, "title"=>"Lavender", "option1"=>"Lavender",
                      "price"=>"38.94", "grams"=>4115, "product_id"=>2759196675},
                     {"id"=>8041889987, "title"=>"Yellow", "option1"=>"Yellow",
                      "price"=>"18.41", "grams"=>7770, "product_id"=>2759196675 }]}

    context "Given a product with id, title and variants" do
      it "should set the product related attributes appropriately" do
        product = Product.new(2759196675, "Synergistic Bronze Pants", "Pants", variants)

        expect(product.id).to eq(2759196675)
        expect(product.title).to eq("Synergistic Bronze Pants")
        expect(product.product_type).to eq("Pants")
        expect(product.variants.map(&:price)).to match_array([38.94, 18.41])
      end
    end
  end
end
