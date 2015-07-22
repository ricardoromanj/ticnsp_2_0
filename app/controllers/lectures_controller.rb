class LecturesController < WebApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy, :assign_coordinator, :unassign_coordinator, :enroll_child, :unenroll_child]

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
  end

  # POST /lectures/1/assign_coordinator
  def assign_coordinator
    if @lecture.set_mark :coordinator_lecture, User.find(params[:id])
      redirect_to @lecture, notice: 'Coordinator successfully assigned'
    else
      redirect_to @lecture, alert: 'Could not assign coordinator'
    end
  end

  # DELETE /lectures/1/unassign_coordinator
  def unassign_coordinator
    if @lecture.remove_mark :coordinator_lecture, User.find(params[:id])
      redirect_to @lecture, notice: 'Coordinator successfully unassigned'
    else
      redirect_to @lecture, alert: 'Could not unassign coordinator'
    end
  end

  # POST /lectures/1/enroll_child
  def enroll_child
    if @lecture.set_mark :enrolled_lecture, Child.find(params[:id])
      redirect_to @lecture, notice: 'Child successfully enrolled'
    else
      redirect_to @lecture, alert: 'Could not enroll child'
    end
  end

  # DELETE /lectures/1/unenroll_child
  def unenroll_child
    if @lecture.remove_mark :enrolled_lecture, Child.find(params[:id])
      redirect_to @lecture, notice: 'Child successfully unenrolled'
    else
      redirect_to @lecture, alert: 'Could not unenroll child'
    end
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:name, :description, :image_id)
    end
end
