class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
  @product = Product.find(params[:product_id])
  @comment = @product.comments.new(comment_params)
  @comment.user = current_user
  @comment.save
  redirect_to product_path(@product)
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
