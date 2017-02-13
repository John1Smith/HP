class CompositionproductsController < ApplicationController
  before_action :set_compositionproduct, only: [:show, :edit, :update, :destroy]

  # GET /compositionproducts
  # GET /compositionproducts.json
  def index
    @compositionproducts = Compositionproduct.all
  end

  # GET /compositionproducts/1
  # GET /compositionproducts/1.json
  def show
  end

  # GET /compositionproducts/new
  def new
    @compositionproduct = Compositionproduct.new
  end

  # GET /compositionproducts/1/edit
  def edit
  end

  # POST /compositionproducts
  # POST /compositionproducts.json
  def create
    @compositionproduct = Compositionproduct.new(compositionproduct_params)

    respond_to do |format|
      if @compositionproduct.save
        format.html { redirect_to @compositionproduct, notice: 'Compositionproduct was successfully created.' }
        format.json { render :show, status: :created, location: @compositionproduct }
      else
        format.html { render :new }
        format.json { render json: @compositionproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compositionproducts/1
  # PATCH/PUT /compositionproducts/1.json
  def update
    respond_to do |format|
      if @compositionproduct.update(compositionproduct_params)
        format.html { redirect_to @compositionproduct, notice: 'Compositionproduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @compositionproduct }
      else
        format.html { render :edit }
        format.json { render json: @compositionproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compositionproducts/1
  # DELETE /compositionproducts/1.json
  def destroy
    @compositionproduct.destroy
    respond_to do |format|
      format.html { redirect_to compositionproducts_url, notice: 'Compositionproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compositionproduct
      @compositionproduct = Compositionproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compositionproduct_params
      params.require(:compositionproduct).permit(:product_id, :composition_id)
    end
end
