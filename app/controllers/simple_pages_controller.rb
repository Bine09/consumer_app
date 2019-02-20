class SimplePagesController < ApplicationController
  # def index  #methode called index

  # def landing_page
  #   @featured_product = Product.first
  # end

  def landing_page
  @products = Product.order("RANDOM()").limit(3) # "RANDOM()" will be disallowd in Rails 6.0
  end


end
