class DoshasController < ApplicationController
  before_action :set_dosha, only: [:show, :edit, :update, :destroy]

  # GET /doshas
  # GET /doshas.json
  def index
    @doshas = Dosha.all
  end

  # GET /doshas/1
  # GET /doshas/1.json
  def show
  end

  # GET /doshas/new
  def new
    @dosha = Dosha.new
  end

  # GET /doshas/1/edit
  def edit
  end

  # POST /doshas
  # POST /doshas.json
  def create
    @dosha = Dosha.new(dosha_params)

    respond_to do |format|
      if @dosha.save
        format.html { redirect_to @dosha, notice: 'Dosha was successfully created.' }
        format.json { render :show, status: :created, location: @dosha }
      else
        format.html { render :new }
        format.json { render json: @dosha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doshas/1
  # PATCH/PUT /doshas/1.json
  def update
    respond_to do |format|
      if @dosha.update(dosha_params)
        format.html { redirect_to @dosha, notice: 'Dosha was successfully updated.' }
        format.json { render :show, status: :ok, location: @dosha }
      else
        format.html { render :edit }
        format.json { render json: @dosha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doshas/1
  # DELETE /doshas/1.json
  def destroy
    @dosha.destroy
    respond_to do |format|
      format.html { redirect_to doshas_url, notice: 'Dosha was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dosha
      @dosha = Dosha.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dosha_params
      params.require(:dosha).permit(:name, :desc)
    end
end
