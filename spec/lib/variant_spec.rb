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
    context "Given a variant with a product title and other variant related attributes" do
      it "should set the full title, price in float and other attributes as properties of a variant" do
        expect(variant.price).to eq(14.30)
        expect(variant.price).to be_instance_of(Float)
        expect(variant.grams).to eq(3030)
        expect(variant.full_title).to eq("Heavy Duty Concrete Keyboard Magenta")
      end
    end
  end

  describe '.sort_by_ascending_price' do
    context "Given a number of variants" do
      it "sorts the variants based in ascending price order" do
        expect(Variant.sort_by_ascending_price(variants)).to eq([variant2, variant])
      end
    end
  end

  describe '.total_cost' do
    context "Given a number of variants" do
      it "calculates the total cost of all those variants" do
        expect(Variant.total_cost(variants)).to eq(25.6)
      end
    end
  end

  describe '.total_weight' do
    context "Given a number of variants" do
      it "calculates the total weight of all those variants in grams" do
        expect(Variant.total_weight(variants)).to eq(6060)
      end
    end
  end

  describe '.get_full_title' do
    context "Given a number of variants" do
      it "gets the full titles wrt all those variants" do
        expect(Variant.get_full_title(variants)).to eq(["Heavy Duty Concrete Keyboard Magenta",
                                                        "Heavy Duty Concrete Keyboard Lavender"])
      end
    end
  end
end
