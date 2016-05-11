class Product
  attr_reader :id, :title, :variants

  def initialize(id, title, product_variants)
    @id, @title = id, title
    @variants = get_variants(product_variants)
  end

  private

    def get_variants(product_variants)
      product_variants.each_with_object([]) do |variant, variants|
        variants << Variant.new(variant["id"], variant["title"], variant["product_id"],
                                variant["price"], variant["grams"])
      end
    end
end
