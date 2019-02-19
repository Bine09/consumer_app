class OrdersController < ApplicationController    # The first line declares a class that inherits from ApplicationControlle,
  #meaning it has access to all the methods inside your application_controller.rb file
  def index   # list of multiple orders
    @orders = Order.all
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
