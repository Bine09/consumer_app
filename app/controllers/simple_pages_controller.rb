class SimplePagesController < ApplicationController
  # def index  #methode called index

  # def landing_page
  #   @featured_product = Product.first
  # end

  def landing_page
  @products = Product.limit(3)
  end


end
