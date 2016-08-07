class CoordinatorSemestersController < WebApplicationController
  before_action :set_coordinator_semester, only: [:show, :edit, :update, :destroy]

  # GET /coordinator_semesters
  # GET /coordinator_semesters.json
  def index
    @semester = ( params[:semester] == nil ? Semester.where( current: true ).first : Semester.find( params[:semester] ) )
    @coordinator_semesters = CoordinatorSemester.where( semester: @semester ).order( created_at: :desc )
  end

  # GET /coordinator_semesteres/current
  def current
    @semester = ( params[:semester] == nil ? @current_semester : Semester.find( params[:semester] ) )
    render json: User.where( id: CoordinatorSemester.where( semester: @semester ).pluck( :coordinator_id ) ).select(:id, :name, :lastname).map { |c| { id: c.id, name: "#{c.name} #{c.lastname}"} }, status: 200
  end

  # GET /coordinator_semesters/1
  # GET /coordinator_semesters/1.json
  def show
  end

  # GET /coordinator_semesters/new
  def new
    @coordinator_semester = CoordinatorSemester.new
  end

  # GET /coordinator_semesters/1/edit
  def edit
  end

  # POST /coordinator_semesters
  # POST /coordinator_semesters.json
  def create
    @coordinator_semester = CoordinatorSemester.new(coordinator_semester_params)

    respond_to do |format|
      if @coordinator_semester.save
        format.html { redirect_to coordinator_semesters_url, notice: 'Coordinator semester was successfully created.' }
        format.json { render :show, status: :created, location: @coordinator_semester }
      else
        format.html { render :new }
        format.json { render json: @coordinator_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coordinator_semesters/1
  # PATCH/PUT /coordinator_semesters/1.json
  def update
    respond_to do |format|
      if @coordinator_semester.update(coordinator_semester_params)
        format.html { redirect_to coordinator_semesters_url, notice: 'Coordinator semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @coordinator_semester }
      else
        format.html { render :edit }
        format.json { render json: @coordinator_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinator_semesters/1
  # DELETE /coordinator_semesters/1.json
  def destroy
    @coordinator_semester.destroy
    respond_to do |format|
      format.html { redirect_to coordinator_semesters_url, notice: 'Coordinator semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator_semester
      @coordinator_semester = CoordinatorSemester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinator_semester_params
      params.require(:coordinator_semester).permit(:coordinator_id, :semester_id, :notes)
    end
end
