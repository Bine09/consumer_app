   # each action corresponds to an HTML file in the views with the same name!!!

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]  #gives data to actions
  load_and_authorize_resource #filter method to allow cancancan to authorize access for the controllers' actions. Otherwise, your authorization checks won't trigger.
  # GET /products
  # GET /products.json
  def index
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term)
      # return our filtered list here
      logger.debug "Amount Products: #{@products.count} found for #{search_term}"
    else
      # byebug   uncomment this in order to break
      @products = Product.all
      logger.debug "Amount Products: #{@products.count}"
  end

    # redirect_to simple_pages_landing_page_path
    # @test_variable= 42
  end               #corresponds to the index.html.erb page inside the views/products folder

# Variables you define inside a controller method will be available inside the corresponding view file. Here,
# the controller makes all entries of the database available in the views through the variable @products.


  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id]) #shows data stored in database
    @comments = @product.comments.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")  #paginate comments with default value 3
    @comment = @product.comments.build
  end




  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :color, :price)
    end
end
