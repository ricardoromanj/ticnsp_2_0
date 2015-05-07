class CatechesesController < ApplicationController
  before_action :set_catechese, only: [:show, :edit, :update, :destroy]

  # GET /catecheses
  # GET /catecheses.json
  def index
    @catecheses = Catechesis.all
  end

  # GET /catecheses/1
  # GET /catecheses/1.json
  def show
  end

  # GET /catecheses/new
  def new
    @catechese = Catechesis.new
  end

  # GET /catecheses/1/edit
  def edit
  end

  # POST /catecheses
  # POST /catecheses.json
  def create
    @catechese = Catechesis.new(catechese_params)

    respond_to do |format|
      if @catechese.save
        format.html { redirect_to @catechese, notice: 'Catechesis was successfully created.' }
        format.json { render :show, status: :created, location: @catechese }
      else
        format.html { render :new }
        format.json { render json: @catechese.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catecheses/1
  # PATCH/PUT /catecheses/1.json
  def update
    respond_to do |format|
      if @catechese.update(catechese_params)
        format.html { redirect_to @catechese, notice: 'Catechesis was successfully updated.' }
        format.json { render :show, status: :ok, location: @catechese }
      else
        format.html { render :edit }
        format.json { render json: @catechese.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catecheses/1
  # DELETE /catecheses/1.json
  def destroy
    @catechese.destroy
    respond_to do |format|
      format.html { redirect_to catecheses_url, notice: 'Catechesis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catechese
      @catechese = Catechesis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catechese_params
      params.require(:catechese).permit(:name, :description, :image_id)
    end
end
