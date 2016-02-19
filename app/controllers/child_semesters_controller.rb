class ChildSemestersController < WebApplicationController
  before_action :set_child_semester, only: [:show, :edit, :update, :pay, :unpay, :destroy, :sweet_destroy]

  # GET /child_semesters
  # GET /child_semesters.json
  def index
    @semester = ( params[:semester] == nil ? @current_semester : Semester.find( params[:semester] ) )
    @paid = ( [0,1,2].include? params[:paid].to_i ) ? params[:paid].to_i : 0
    @child_semesters = ChildSemester.where( semester: @semester )
    if [1,2].include? @paid
      @child_semesters = @child_semesters.where( "paid_at is #{ @paid == 1 ? 'not ' : ''}null" )
    end
    @child_semesters = @child_semesters.order( created_at: :desc )
  end

  # get /child_semesters/current
  def current
    @semester = ( params[:semester] == nil ? @current_semester : Semester.find( params[:semester] ) )
    render json: Child.where( id: ChildSemester.where( semester: Semester.first ).pluck( :child_id ) ).select(:id, :name, :lastname).map { |c| { id: c.id, name: "#{c.name} #{c.lastname}"} }, status: 200
  end

  # GET /child_semesters/1
  # GET /child_semesters/1.json
  def show
  end

  # GET /child_semesters/new
  def new
    @child_semester = ChildSemester.new
  end

  # GET /child_semesters/1/edit
  def edit
  end

  # POST /child_semesters
  # POST /child_semesters.json
  def create
    @child_semester = ChildSemester.new(child_semester_params)

    respond_to do |format|
      if @child_semester.save
        format.html { redirect_to child_semesters_url, notice: 'Child semester was successfully created.' }
        format.json { render :show, status: :created, location: @child_semester }
      else
        format.html { render :new }
        format.json { render json: @child_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /child_semesters/1
  # PATCH/PUT /child_semesters/1.json
  def update
    respond_to do |format|
      if @child_semester.update(child_semester_params)
        format.html { redirect_to child_semesters_url, notice: 'Child semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @child_semester }
      else
        format.html { render :edit }
        format.json { render json: @child_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT/PATCH /child_semester/1/pay
  def pay
    respond_to do |format|
      if @child_semester.update( paid_at: Time.now, paid_amt: params[:paid_amt]  )
        format.html { redirect_to child_semesters_url, notice: 'Child semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @child_semester }
      else
        format.html { render :edit }
        format.json { render json: @child_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT/PATCH /child_semester/1/unpay
  def unpay
    respond_to do |format|
      if @child_semester.update( paid_at: nil, paid_amt: 0.0 )
        format.html { redirect_to child_semesters_url, notice: 'Child semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @child_semester }
      else
        format.html { render :edit }
        format.json { render json: @child_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /child_semesters/1
  # DELETE /child_semesters/1.json
  def destroy
    @child_semester.destroy
    respond_to do |format|
      format.html { redirect_to child_semesters_url, notice: 'Child semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /child_semesters/1/sweet_destroy
  def sweet_destroy
    @child_semester.destroy
    render json: { success: true }, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_semester
      @child_semester = ChildSemester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_semester_params
      params.require(:child_semester).permit(:child_id, :semester_id, :paid, :notes)
    end
end
