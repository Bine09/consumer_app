class CommentsController < ApplicationController
  load_and_authorize_resource     #method in your controller to load the resource into an instance variable and authorize it automatically for every action in that controller. Authorization!!! cancancan gem

def create
  @product = Product.find(params[:product_id])
  @comments = @product.comments.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")  #paginate comments with default value 3
  @comment = @product.comments.new(comment_params)
  @comment.user = current_user


  respond_to do |format| # a method on the superclass ActionController.
    if @comment.save
      ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
      format.html { redirect_to @product, notice: 'Review was created successfully.' }
      format.json { render :show, status: :created, location: @product }
      format.js  #Whenever you make an AJAX request, Rails will check your controller for a respond_to :js to figure out whether or not you allow access through AJAX
    else
      format.html { render :template => "products/show", alert: 'Review was not saved successfully.' }  #Rails knows that this view belongs to a different controller (here product controller) because of the embedded slash character in the string
      format.json { render json: @comment.errors, status: :unprocessable_entity }
      format.js
    end
  end

  end

  def destroy           #we need to retrieve the product record from the comment before we delete it, and redirect the user to that page
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end



private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end


#The MVC logic in Rails is that controllers pass instance variables to the views. !!!!
