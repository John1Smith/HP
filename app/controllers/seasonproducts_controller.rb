class SeasonproductsController < ApplicationController
  before_action :set_seasonproduct, only: [:show, :edit, :update, :destroy]

  # GET /seasonproducts
  # GET /seasonproducts.json
  def index
    @seasonproducts = Seasonproduct.all
  end

  # GET /seasonproducts/1
  # GET /seasonproducts/1.json
  def show
  end

  # GET /seasonproducts/new
  def new
    @seasonproduct = Seasonproduct.new
  end

  # GET /seasonproducts/1/edit
  def edit
  end

  # POST /seasonproducts
  # POST /seasonproducts.json
  def create
    @seasonproduct = Seasonproduct.new(seasonproduct_params)

    respond_to do |format|
      if @seasonproduct.save
        format.html { redirect_to @seasonproduct, notice: 'Seasonproduct was successfully created.' }
        format.json { render :show, status: :created, location: @seasonproduct }
      else
        format.html { render :new }
        format.json { render json: @seasonproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seasonproducts/1
  # PATCH/PUT /seasonproducts/1.json
  def update
    respond_to do |format|
      if @seasonproduct.update(seasonproduct_params)
        format.html { redirect_to @seasonproduct, notice: 'Seasonproduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @seasonproduct }
      else
        format.html { render :edit }
        format.json { render json: @seasonproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasonproducts/1
  # DELETE /seasonproducts/1.json
  def destroy
    @seasonproduct.destroy
    respond_to do |format|
      format.html { redirect_to seasonproducts_url, notice: 'Seasonproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seasonproduct
      @seasonproduct = Seasonproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seasonproduct_params
      params.require(:seasonproduct).permit(:product_id, :season_id)
    end
end
