class DoshaproductsController < ApplicationController
  before_action :set_doshaproduct, only: [:show, :edit, :update, :destroy]

  # GET /doshaproducts
  # GET /doshaproducts.json
  def index
    @doshaproducts = Doshaproduct.all
  end

  # GET /doshaproducts/1
  # GET /doshaproducts/1.json
  def show
  end

  # GET /doshaproducts/new
  def new
    @doshaproduct = Doshaproduct.new
  end

  # GET /doshaproducts/1/edit
  def edit
  end

  # POST /doshaproducts
  # POST /doshaproducts.json
  def create
    @doshaproduct = Doshaproduct.new(doshaproduct_params)

    respond_to do |format|
      if @doshaproduct.save
        format.html { redirect_to @doshaproduct, notice: 'Doshaproduct was successfully created.' }
        format.json { render :show, status: :created, location: @doshaproduct }
      else
        format.html { render :new }
        format.json { render json: @doshaproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doshaproducts/1
  # PATCH/PUT /doshaproducts/1.json
  def update
    respond_to do |format|
      if @doshaproduct.update(doshaproduct_params)
        format.html { redirect_to @doshaproduct, notice: 'Doshaproduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @doshaproduct }
      else
        format.html { render :edit }
        format.json { render json: @doshaproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doshaproducts/1
  # DELETE /doshaproducts/1.json
  def destroy
    @doshaproduct.destroy
    respond_to do |format|
      format.html { redirect_to doshaproducts_url, notice: 'Doshaproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doshaproduct
      @doshaproduct = Doshaproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doshaproduct_params
      params.require(:doshaproduct).permit(:product_id, :dosha_id)
    end
end
