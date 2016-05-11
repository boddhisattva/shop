describe Store do
  describe "#initialize" do
    context "Given a store with name, denomination and quantity" do
      it "should set the store related attributes appropriately" do
        parsed_products_data = {"products"=>[{"id"=>2759196675, "title"=>"Synergistic Bronze Pants",
                                              "handle"=>"synergistic-bronze-pants",
                                              "variants"=>[{"id"=>8041889923, "title"=>"Lavender", "option1"=>"Lavender", "price"=>"38.94",
                                                            "grams"=>4115, "product_id"=>2759196675},
                                                           {"id"=>8041889987, "title"=>"Yellow", "option1"=>"Yellow", "price"=>"18.41",
                                                            "grams"=>7770, "product_id"=>2759196675, }]}]}


        store = Store.new(parsed_products_data["products"])

        expect(store.products.first.id).to eq(2759196675)
      end
    end
  end
end



