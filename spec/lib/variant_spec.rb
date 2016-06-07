describe Variant do

  let(:product_title) { "Heavy Duty Concrete Keyboard" }
  let(:variant) do
    Variant.new(product_title, "id" => 8041889923, "title" => "Magenta",
                               "product_id" => 2759196675, "price" => "14.30", "grams" => 3030)
  end
  let(:variant2) do
    Variant.new(product_title, "id" => 8041889932, "title" => "Lavender",
                               "product_id" => 2759196675, "price" => "11.30", "grams" => 3030)
  end
  let(:variants) do
    [variant, variant2]
  end

  describe "#initialize" do
    context "Given a Variant with id, title, product_id, price and weight in grams" do
      it "should set the variant related attributes appropriately" do
        expect(variant.price).to eq(14.30)
        expect(variant.grams).to eq(3030)
        expect(variant.full_title).to eq("Heavy Duty Concrete Keyboard Magenta")
      end
    end
  end

  describe '.sort_by_ascending_price' do
    context "Given a number of product variants" do
      it "sorts the variants based in ascending price order" do
        expect(Variant.sort_by_ascending_price(variants)).to eq([variant2, variant])
      end
    end
  end

  describe '.total_cost' do
    context "Given a number of product variants" do
      it "calculates the total cost of all those variants" do
        expect(Variant.total_cost(variants)).to eq(25.6)
      end
    end
  end
end
