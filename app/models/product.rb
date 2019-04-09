class Product < ApplicationRecord  #means that your product class is a subclass of, or inherits from, the ApplicationRecord class.

  has_many :comments
  validates :name, presence: true  #a validation to the Product model that requires all new products to have a name provided



  def self.search(search_term)
    if  Rails.env.production?      #postgres db can make trouble by using "Like"
    Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end



  def highest_rating_comment
  comments.rating_desc.first
  end

  def lowest_rating_comment
  comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end
  end
