module ProductsHelper
  def cache_key_for_products
      count          = @products
      max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
      "products/all-#{count}-#{max_updated_at}"
    end
# When different parts of the page need to be cached and expired separately you can use Fragment Caching.

end
