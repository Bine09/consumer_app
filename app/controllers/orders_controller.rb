class OrdersController < ApplicationController    # The first line declares a class that inherits from ApplicationControlle,
  #meaning it has access to all the methods inside your application_controller.rb file

  before_action :authenticate_user!

  def index   # list of multiple orders
    @orders = Order.includes(:product).all
    # @orders = Order.includes(:product).all
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
