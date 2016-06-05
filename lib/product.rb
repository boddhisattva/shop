class Product
  attr_reader :variants, :product_type

  def initialize(id, title, product_type, product_variants)
    @id = id
    @title = title
    @product_type = product_type
    @variants = get_variants(title, product_variants)
  end

  def self.filter_by_type(products, type)
    products.select { |product| product.product_type == type }
  end

  def self.collect_variants(products)
    products.collect(&:variants).flatten
  end

  private

    def get_variants(product_title, product_variants)
      product_variants.each_with_object([]) do |variant, variants|
        variants << Variant.new(product_title, variant)
      end
    end
end
