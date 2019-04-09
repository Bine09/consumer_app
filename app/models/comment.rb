class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }, presence: true




  #Because every comment record should be saved with a user ID, a product ID, and a message, it's a good idea to validate the presence of all of those attributes
  #(for the product and user relations, we validate the relation, not the name
  #of the database field, so we use the :user symbol instead of :user_id). This way, we'll ensure that the rating must be an integer value.


  def create
  @product = Product.find(params[:product_id])
  @comment = @product.comments.new(comment_params)
  @comment.user = current_user



    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

end
end
