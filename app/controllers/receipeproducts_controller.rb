class ReceipeproductsController < ApplicationController
  before_action :set_receipeproduct, only: [:show, :edit, :update, :destroy]

  # GET /receipeproducts
  # GET /receipeproducts.json
  def index
    @receipeproducts = Receipeproduct.all
  end

  # GET /receipeproducts/1
  # GET /receipeproducts/1.json
  def show
  end

  # GET /receipeproducts/new
  def new
    @receipeproduct = Receipeproduct.new
  end

  # GET /receipeproducts/1/edit
  def edit
  end

  # POST /receipeproducts
  # POST /receipeproducts.json
  def create
    @receipeproduct = Receipeproduct.new(receipeproduct_params)

    respond_to do |format|
      if @receipeproduct.save
        format.html { redirect_to @receipeproduct, notice: 'Receipeproduct was successfully created.' }
        format.json { render :show, status: :created, location: @receipeproduct }
      else
        format.html { render :new }
        format.json { render json: @receipeproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipeproducts/1
  # PATCH/PUT /receipeproducts/1.json
  def update
    respond_to do |format|
      if @receipeproduct.update(receipeproduct_params)
        format.html { redirect_to @receipeproduct, notice: 'Receipeproduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipeproduct }
      else
        format.html { render :edit }
        format.json { render json: @receipeproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipeproducts/1
  # DELETE /receipeproducts/1.json
  def destroy
    @receipeproduct.destroy
    respond_to do |format|
      format.html { redirect_to receipeproducts_url, notice: 'Receipeproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipeproduct
      @receipeproduct = Receipeproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipeproduct_params
      params.require(:receipeproduct).permit(:product_id, :receipe_id, :quantity)
    end
end
