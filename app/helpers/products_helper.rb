module ProductsHelper
  def cache_key_for_products
      count          = @products.length   #counts products in index
      max_updated_at = @products.maximum(:updated_at).try(:utc).try(:to_s, :number) #looks for last updated product
      "products/all-#{count}-#{max_updated_at}"  #generates cache key
    end
# When different parts of the page need to be cached and expired separately you can use Fragment Caching.

end
