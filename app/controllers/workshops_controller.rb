class WorkshopsController < WebApplicationController
  before_action :set_workshop, only: [:show, :edit, :update, :destroy, :assign_coordinator, :unassign_coordinator, :enroll_child, :unenroll_child]

  # GET /workshops
  # GET /workshops.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: WorkshopDatatable.new(view_context) }
    end
  end

  # GET /workshops/typeaheaddata.json
  def typeaheaddata
    render json: Workshop.select(:id, :name), status: 200
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show
  end

  # POST /workshops/1/assign_coordinator
  def assign_coordinator
    if @workshop.set_mark :coordinator_workshop, User.find(params[:id])
      redirect_to @workshop, notice: 'Coordinator successfully assigned'
    else
      redirect_to @workshops, alert: 'Could not assign coordinator'
    end
  end

  # DELETE /workshops/1/unassign_coordinator
  def unassign_coordinator
    if @workshop.remove_mark :coordinator_workshop, User.find(params[:id])
      redirect_to @workshop, notice: 'Coordinator successfully unassigned'
    else
      redirect_to @workshops, alert: 'Could not unassign coordinator'
    end
  end

  # POST /workshops/1/enroll_child
  def enroll_child
    if @workshop.set_mark :enrolled_workshop, Child.find(params[:id])
      redirect_to @workshop, notice: 'Child successfully enrolled'
    else
      redirect_to @workshops, alert: 'Could not enroll child'
    end
  end

  # DELETE /workshops/1/unenroll_child
  def unenroll_child
    if @workshop.remove_mark :enrolled_workshop, Child.find(params[:id])
      redirect_to @workshop, notice: 'Child successfully unenrolled'
    else
      redirect_to @workshops, alert: 'Could not unenroll child'
    end
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  # POST /workshops.json
  def create
    @workshop = Workshop.new(workshop_params)

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: 'Workshop was successfully created.' }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render :new }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshops/1
  # PATCH/PUT /workshops/1.json
  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to @workshop, notice: 'Workshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @workshop }
      else
        format.html { render :edit }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.json
  def destroy
    @workshop.destroy
    respond_to do |format|
      format.html { redirect_to workshops_url, notice: 'Workshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_params
      params.require(:workshop).permit(:name, :description, :image)
    end
end
