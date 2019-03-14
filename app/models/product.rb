class Product < ApplicationRecord  #means that your product class is a subclass of, or inherits from, the ApplicationRecord class.
  has_many :comments

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

  end
