class ProductsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @comps = Composition.all
    @product = Product.new

    products_scope = Product.all
    products_scope = products_scope.where("name LIKE ?", "%#{params[:filter]}%")  if params[:filter]
    @products = smart_listing_create :products, products_scope, partial: "products/list",  page_sizes: [500]
  end

  def filter
    composition_id = params[:product][:compositions]
    p "ID:#{composition_id}"

    # binding.pry

    @comp = Composition.find(composition_id) if composition_id

    @comps = Composition.all
    @product = Product.new

    products = @comp.products
    products_scope = products.order('compositionproducts.quantity desc')
    # products_scope = @comp.products
       
    @products = smart_listing_create :products, products_scope, partial: "products/list",  page_sizes: [100]
    render 'index'
  end

  # GET /products/1
  # GET /products/1.json
  def show
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
      params.require(:product).permit(:name, :desc, :img_url)
    end
end
