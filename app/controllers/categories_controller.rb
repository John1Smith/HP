class CategoriesController < ApplicationController
   include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token  

  # curl http://localhost:3000/categories.json
  # GET /categories
  # GET /categories.json
  def index
    categories_scope = Category.all
    categories_scope = categories_scope.where("name LIKE ?", "%#{params[:filter]}%") if params[:filter] 


    # @categories = Category.all
   smart_listing_create :categories, categories_scope, partial: "categories/list", page_sizes: [100]
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end
 
  # curl http://localhost:3000/categories.json -X POST -H 'Content-type: application/json' -d '{"name":"Специи","desc":"very"}'
  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    # binding.pry
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # curl http://localhost:3000/categories/21.json -X PUT -H 'Content-type: application/json' -d '{"name":"RtyСпеции"}'  
  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # curl http://localhost:3000/categories/21.json -X DELETE -H 'Content-type: application/json'   
  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :desc)
    end
end

 
