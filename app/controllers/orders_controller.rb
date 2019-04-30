class OrdersController < ApplicationController    # The first line declares a class that inherits from ApplicationControlle,
  #meaning it has access to all the methods inside your application_controller.rb file

  before_action :authenticate_user!  #routes to the login / signup if not authenticated #checking if User is logedin for every action -- devise gem

  def index   # list of multiple orders
    @orders = Order.includes(:product).all #'includes' specify relationships to be included in the result set. allows  to access the product attribute

    end

    def show  #show order
    @order = Order.find(params[:id])
    end

    def new
    end

    def create
    end

    def destroy
    end

end
