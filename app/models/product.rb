class Product < ApplicationRecord  #means that your product class is a subclass of, or inherits from, the ApplicationRecord class.
  def self.search(search_term)
    if  Rails.env.production?      #postgres db can make trouble by using "Like"
    Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

end
