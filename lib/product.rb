class Product
  attr_reader :variants, :product_type

  def initialize(id, title, product_type, product_variants)
    @id, @title, @product_type = id, title, product_type
    @variants = get_variants(product_variants, title)
  end

  private

    def get_variants(product_variants, title)
      product_variants.each_with_object([]) do |variant, variants|
        variants << Variant.new(variant["id"], variant["title"], variant["product_id"],
                                variant["price"], variant["grams"], title)
      end
    end
end
