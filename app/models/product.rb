class Product < ApplicationRecord  #means that your product class is a subclass of, or inherits from, the ApplicationRecord class.

  has_many :comments,  dependent: :destroy  #means, that when a product is deleted the comments have to be, too.
  validates :name, presence: true  #a validation to the Product model that requires all new products to have a name provided



  def self.search(search_term)
    if  Rails.env.production?      #postgres db can make trouble by using "Like"
    Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end



  def highest_rating_comment
     Rails.cache.fetch([cache_key_with_version, __method__]) do
           puts("Added to cache:" + cache_key_with_version + __method__.to_s)
           comments.rating_desc.first    #methods for the comments of the special product have to be later shown in the view (just showing one with the hightest/ lowest points)
     end
   end

  def lowest_rating_comment
    Rails.cache.fetch([cache_key_with_version, __method__]) do
        puts("Added to cache:" + cache_key_with_version.to_s + __method__.to_s)
        comments.rating_asc.first    #methods for the comments of the special product have to be later shown in the view (just showing one with the hightest/ lowest points)
      end
  end

  def average_rating
    Rails.cache.fetch([cache_key_with_version, __method__]) do
        puts("Added to cache:" + cache_key_with_version.to_s + __method__.to_s)
        comments.average(:rating).to_f
      end
  end
end
