class SimplePagesController < ApplicationController
  # def index  #methode called index

  # def landing_page
  #   @featured_product = Product.first
  # end

  def landing_page
  @products = Product.order("RANDOM()").limit(3) # "RANDOM()" will be disallowd in Rails 6.0
  end

  # def about
  #   redirect_to simple_pages_contact_path
  # end

  # def thank_you
  #   @name = params[:name]
  #    @email = params[:email]
  #    @message = params[:message]
  #    ActionMailer::Base.mail(from: @email,
  #        to: 'bine09@gmx.de',
  #        subject: "A new contact form message from #{@name}",
  #        body: @message).deliver_now
  # end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
