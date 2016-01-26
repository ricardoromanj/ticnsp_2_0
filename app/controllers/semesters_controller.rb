class SemestersController < WebApplicationController
  before_action :set_semester, only: [:show, :edit, :update, :destroy]

  # GET /semesters
  # GET /semesters.json
  def index
    @semesters = Semester.all
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  # POST /semesters
  # POST /semesters.json
  def create
    if current_user.usertype == 'admin'
      @semester = Semester.new(semester_params)

      respond_to do |format|
        if @semester.save
          format.html { redirect_to semesters_url, notice: 'Semester was successfully created.' }
          format.json { render :show, status: :created, location: @semester }
        else
          format.html { render :new }
          format.json { render json: @semester.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { redirect_to @semester, alert: 'Privilegios insuficientes' }
      format.json { render json: { success: false, reason: 'Insufficient privileges' } }
    end
  end

  # PATCH/PUT /semesters/1
  # PATCH/PUT /semesters/1.json
  def update
    if current_user.usertype == 'admin'
      respond_to do |format|
        if @semester.update(semester_params)
          format.html { redirect_to semesters_url, notice: 'Semester was successfully updated.' }
          format.json { render :show, status: :ok, location: @semester }
        else
          format.html { render :edit }
          format.json { render json: @semester.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { redirect_to @semester, alert: 'Privilegios insuficientes' }
      format.json { render json: { success: false, reason: 'Insufficient privileges' } }
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.json
  def destroy
    if current_user.usertype == 'admin'
      @semester.destroy
      respond_to do |format|
        format.html { redirect_to semesters_url, notice: 'Semester was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      format.html { redirect_to @semester, alert: 'Privilegios insuficientes' }
      format.json { render json: { success: false, reason: 'Insufficient privileges' } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semester_params
      params.require(:semester).permit(:start_date, :end_date, :name, :current)
    end
end
