class SimplePagesController < ApplicationController
  # def index  #methode called index

  def landing_page
    @featured_product = Product.first
  end
end
