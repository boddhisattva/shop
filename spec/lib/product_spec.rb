describe Product do
  describe "#initialize" do
    let(:variants) do
      [{ "id" => 8041889923, "title" => "Lavender", "option1" => "Lavender",
         "price" => "38.94", "grams" => 4115, "product_id" => 2759196675 },
       { "id" => 8041889987, "title" => "Yellow", "option1" => "Yellow",
         "price" => "18.41", "grams" => 7770, "product_id" => 2759196675 }]
    end

    context "Given a product with id, title and variants" do
      it "should set the product related attributes appropriately" do
        product = Product.new(2759196675, "Synergistic Bronze Pants", "Pants", variants)

        expect(product.product_type).to eq("Pants")
        expect(product.variants.map(&:price)).to match_array([38.94, 18.41])
      end
    end
  end

  describe ".filter_by_type" do
    context "Given a set of products and a particular product type" do
      it "filters the products based on the product type" do
        parsed_products_data = { "products" => [{ "id" => 2759196675, "title" => "Aerodynamic Cotton Keyboard",
                                                  "handle" => "aerodynamic-cotton-keyboard", "product_type" => "Keyboard",
                                                  "variants" => [{ "id" => 8041889923, "title" => "Lavender", "option1" => "Lavender", "price" => "9",
                                                                   "grams" => 4115, "product_id" => 2759196675 },
                                                                 { "id" => 8041889987, "title" => "Yellow", "option1" => "Yellow", "price" => "8.56",
                                                                   "grams" => 4120, "product_id" => 2759196675 }] },
                                                { "id" => 2757123675, "title" => "Aerodynamic Linen Computer",
                                                  "handle" => "aerodynamic-linen-computer", "product_type" => "Computer",
                                                  "variants" => [{ "id" => 7041299923, "title" => "Cyan", "option1" => "Lavender", "price" => "10",
                                                                   "grams" => 7000, "product_id" => 2757123675 },
                                                                 { "id" => 7041159987, "title" => "Orchid", "option1" => "Yellow", "price" => "12.35",
                                                                   "grams" => 6500, "product_id" => 2757123675 }] }] }

        products = parsed_products_data["products"].each_with_object([]) do |product, items|
                     items << Product.new(product["id"], product["title"], product["product_type"], product["variants"])
                   end

        expect(Product.filter_by_type(products, "Keyboard").count).to eq(1)
      end
    end
  end
end
