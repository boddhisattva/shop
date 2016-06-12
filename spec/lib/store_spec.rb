describe Store do
  let(:parsed_products_data) do
    parsed_products_data = { "products" => [{ "id" => 2759196675, "title" => "Aerodynamic Cotton Keyboard",
                                              "handle" => "aerodynamic-cotton-keyboard", "product_type" => "Keyboard",
                                              "variants" => [{ "id" => 8041889923, "title" => "Lavender", "option1" => "Lavender", "price" => "9",
                                                               "grams" => 4115, "product_id" => 2759196675 },
                                                             { "id" => 8041889987, "title" => "Yellow", "option1" => "Yellow", "price" => "8.56",
                                                               "grams" => 4120, "product_id" => 2759196675 }] },
                                            { "id" => 2757123675, "title" => "Aerodynamic Linen Computer",
                                              "handle" => "aerodynamic-linen-computer", "product_type" => "Computer",
                                              "variants" => [{ "id" => 7041299923, "title" => "Cyan", "option1" => "Cyan", "price" => "10",
                                                               "grams" => 7000, "product_id" => 2757123675 },
                                                             { "id" => 7041159987, "title" => "Orchid", "option1" => "Orchid", "price" => "12.35",
                                                               "grams" => 6500, "product_id" => 2757123675 }] }] }
  end

  describe "#initialize" do
    context "Given a store with a customer and some products" do
      it "should set the store related attributes appropriately" do
        customer = Customer.new("Alice", 1)
        store = Store.new(parsed_products_data["products"], customer)

        expect(store.products.count).to eq(2)
        expect(store.customer).not_to be_nil
      end
    end
  end

  describe "#generate_shopping_list" do
    context "Given a store with a customer and certain products" do
      context "there are an equal number of variants for each product type" do
        it "generates a shopping list with equal no of items using the least amount of money and without duplicate variants" do
          customer = Customer.new("Alice", 1)
          store = Store.new(parsed_products_data["products"], customer)

          shopping_output = "Items purchased - \n\n" \
                            "1. Aerodynamic Cotton Keyboard Yellow\n" \
                            "2. Aerodynamic Linen Computer Cyan\n" \
                            "3. Aerodynamic Cotton Keyboard Lavender\n" \
                            "4. Aerodynamic Linen Computer Orchid\n" \
                            "\nTotal cost of items - $39.91\n" \
                            "\nTotal weight of products - 21735 grams\n"

          expect { store.generate_shopping_list }.to output(shopping_output).to_stdout
        end
      end

      context "there are an unequal number of variants for each product type" do
        it "generates a shopping list with equal no of items using the least amount of money and without duplicate variants" do
          parsed_products_data = { "products" => [{ "id" => 2759196675, "title" => "Aerodynamic Cotton Keyboard",
                                                    "handle" => "aerodynamic-cotton-keyboard", "product_type" => "Keyboard",
                                                    "variants" => [{ "id" => 8041889923, "title" => "Lavender", "option1" => "Lavender", "price" => "9",
                                                                     "grams" => 4115, "product_id" => 2759196675 },
                                                                   { "id" => 8041889987, "title" => "Yellow", "option1" => "Yellow", "price" => "8.56",
                                                                     "grams" => 4120, "product_id" => 2759196675 }] },
                                                  { "id" => 2757123675, "title" => "Aerodynamic Linen Computer",
                                                    "handle" => "aerodynamic-linen-computer", "product_type" => "Computer",
                                                    "variants" => [{ "id" => 7041299923, "title" => "Cyan", "option1" => "Cyan", "price" => "10",
                                                                     "grams" => 7000, "product_id" => 2757123675 }] }] }

          customer = Customer.new("Alice", 1)
          store = Store.new(parsed_products_data["products"], customer)

          shopping_output = "Items purchased - \n\n" \
                            "1. Aerodynamic Linen Computer Cyan\n" \
                            "2. Aerodynamic Cotton Keyboard Yellow\n" \
                            "\nTotal cost of items - $18.56\n" \
                            "\nTotal weight of products - 11120 grams\n"

          expect { store.generate_shopping_list }.to output(shopping_output).to_stdout
        end
      end

      context "there are variants for only one product type" do
        it "does not generate a shopping list" do
          parsed_products_data = { "products" => [{ "id" => 2759196675, "title" => "Aerodynamic Cotton Keyboard",
                                                    "handle" => "aerodynamic-cotton-keyboard", "product_type" => "Keyboard",
                                                    "variants" => [{ "id" => 8041889923, "title" => "Lavender", "option1" => "Lavender", "price" => "9",
                                                                     "grams" => 4115, "product_id" => 2759196675 },
                                                                   { "id" => 8041889987, "title" => "Yellow", "option1" => "Yellow", "price" => "8.56",
                                                                     "grams" => 4120, "product_id" => 2759196675 }] }] }

          customer = Customer.new("Alice", 1)
          store = Store.new(parsed_products_data["products"], customer)

          shopping_output = "There aren't enough variants in one or more product types to generate" \
                            " a shopping list with equal number of items from two product types\n"

          expect { store.generate_shopping_list }.to output(shopping_output).to_stdout
        end
      end
    end

    context "Given a store with a customer and no products" do
      it "does not generate a shopping list" do
        parsed_products_data = { "products" => [] }

        customer = Customer.new("Alice", 1)
        store = Store.new(parsed_products_data["products"], customer)

        expect(store.generate_shopping_list).to be_nil
      end
    end
  end
end
