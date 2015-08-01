class ShepperdingsController < WebApplicationController
  before_action :set_shepperding, only: [:show, :edit, :update, :destroy, :assign_coordinator, :unassign_coordinator, :enroll_child, :unenroll_child]

  # GET /shepperdings
  # GET /shepperdings.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: ShepperdingDatatable.new(view_context) }
    end
  end

  # GET /shepperdings/typeaheaddata.json
  def typeaheaddata
    render json: Shepperding.select(:id, :name), status: 200
  end
  
  # GET /shepperdings/1
  # GET /shepperdings/1.json
  def show
  end

  # POST /shepperdings/1/assign_coordinator
  def assign_coordinator
    if @shepperding.set_mark :coordinator_shepperding, User.find(params[:id])
      redirect_to @shepperding, notice: 'Coordinator successfully assigned'
    else
      redirect_to @shepperding, alert: 'Could not assign coordinator'
    end
  end

  # DELETE /shepperdings/1/unassign_coordinator
  def unassign_coordinator
    if @shepperding.remove_mark :coordinator_shepperding, User.find(params[:id])
      redirect_to @shepperding, notice: 'Coordinator successfully unassigned'
    else
      redirect_to @shepperding, alert: 'Could not unassign coordinator'
    end
  end

  # POST /shepperdings/1/enroll_child
  def enroll_child
    if @shepperding.set_mark :enrolled_shepperding, Child.find(params[:id])
      redirect_to @shepperding, notice: 'Child successfully enrolled'
    else
      redirect_to @shepperding, alert: 'Could not enroll child'
    end
  end

  # DELETE /shepperdings/1/unenroll_child
  def unenroll_child
    if @shepperding.remove_mark :enrolled_shepperding, Child.find(params[:id])
      redirect_to @shepperding, notice: 'Child successfully unenrolled'
    else
      redirect_to @shepperding, alert: 'Could not unenroll child'
    end
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
      params.require(:shepperding).permit(:name, :description, :image)
    end
end
