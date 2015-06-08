class ShepperdingsController < ApplicationController
  before_action :set_shepperding, only: [:show, :edit, :update, :destroy]

  # GET /shepperdings
  # GET /shepperdings.json
  def index
    @shepperdings = Shepperding.all
  end

  # GET /shepperdings/1
  # GET /shepperdings/1.json
  def show
  end

  # GET /shepperdings/new
  def new
    @shepperding = Shepperding.new
  end

  # GET /shepperdings/1/edit
  def edit
  end

  # POST /shepperdings
  # POST /shepperdings.json
  def create
    @shepperding = Shepperding.new(shepperding_params)

    respond_to do |format|
      if @shepperding.save
        format.html { redirect_to @shepperding, notice: 'Shepperding was successfully created.' }
        format.json { render :show, status: :created, location: @shepperding }
      else
        format.html { render :new }
        format.json { render json: @shepperding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shepperdings/1
  # PATCH/PUT /shepperdings/1.json
  def update
    respond_to do |format|
      if @shepperding.update(shepperding_params)
        format.html { redirect_to @shepperding, notice: 'Shepperding was successfully updated.' }
        format.json { render :show, status: :ok, location: @shepperding }
      else
        format.html { render :edit }
        format.json { render json: @shepperding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shepperdings/1
  # DELETE /shepperdings/1.json
  def destroy
    @shepperding.destroy
    respond_to do |format|
      format.html { redirect_to shepperdings_url, notice: 'Shepperding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shepperding
      @shepperding = Shepperding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shepperding_params
      params.require(:shepperding).permit(:name, :description, :image_id)
    end
end
