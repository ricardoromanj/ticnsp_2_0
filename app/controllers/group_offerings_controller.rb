class GroupOfferingsController < WebApplicationController
  before_action :set_group_offering, only: [:show, :edit, :update, :destroy]
  before_action :set_semester, only: [:index, :lectures, :workshops, :shepperdings, :commissions]

  # GET /group_offerings
  # GET /group_offerings.json
  def index
    @group_offerings = GroupOffering.all
  end

  def lectures
    @group_offerings = GroupOffering.where( group_type: Lecture.to_s, semester: @semester ).order( created_at: :desc )
  end

  def workshops
    @group_offerings = GroupOffering.where( group_type: Workshop.to_s, semester: @semester ).order( created_at: :desc )
  end

  def shepperdings
    @group_offerings = GroupOffering.where( group_type: Shepperding.to_s, semester: @semester ).order( created_at: :desc )
  end

  def commissions
    @group_offerings = GroupOffering.where( group_type: Commission.to_s, semester: @semester ).order( created_at: :desc )
  end

  # GET /group_offerings/1
  # GET /group_offerings/1.json
  def show
  end

  # GET /group_offerings/new
  def new
    @group_offering = GroupOffering.new
  end

  # GET /group_offerings/1/edit
  def edit
  end

  # POST /group_offerings
  # POST /group_offerings.json
  def create
    @group_offering = GroupOffering.new(group_offering_params)

    respond_to do |format|
      if @group_offering.save
        format.html { redirect_to eval("#{@group_offering.group_type.downcase.pluralize}_group_offerings_url"), notice: 'Group offering was successfully created.' }
        format.json { render :show, status: :created, location: @group_offering }
      else
        format.html { render :new }
        format.json { render json: @group_offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_offerings/1
  # PATCH/PUT /group_offerings/1.json
  def update
    respond_to do |format|
      if @group_offering.update(group_offering_params)
        format.html { redirect_to @group_offering, notice: 'Group offering was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_offering }
      else
        format.html { render :edit }
        format.json { render json: @group_offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_offerings/1
  # DELETE /group_offerings/1.json
  def destroy
    @group_offering.destroy
    respond_to do |format|
      format.html { redirect_to group_offerings_url, notice: 'Group offering was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_offering
      @group_offering = GroupOffering.find(params[:id])
    end

    def set_semester
      @semester = ( params[:semester] == nil ? @current_semester : Semester.find( params[:semester] ) )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_offering_params
      params.require(:group_offering).permit(:group_id, :group_type, :semester_id)
    end
end
