class NoticesController < WebApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  # GET /notices
  # GET /notices.json
  def index
    @notices = Notice.includes( :user ).order( created_at: :desc ).paginate(page: params[:page], per_page: 5)
  end

  # GET /notices/view
  def view
    @notices = Notice.includes( :user ).order( created_at: :desc ).paginate(page: params[:page], per_page: 5)
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)
    @notice.user = current_user

    respond_to do |format|
      if @notice.save

        # Create a notifition when a notice is created
        users_to_notify = []
        case @notice.audience
        when 'coordinators'
          users_to_notify = User.active_coordinators + User.where(usertype: 'general_coordinator')
        when 'tutors'
          users_to_notify = User.tutors + User.where( usertype: 'admin' )
        when 'all'
          users_to_notify = User.where( active: true )
        else
          # nothing to do here ...here
        end

        users_to_notify.each do |user|
          notification = Notification.create( recipient: user, actor: current_user, action: 'publicó', notifiable: @notice )

          # Create send notification by email background job
          NoticeEmailJob.new.async.perform( user, @notice )
        end

        # Send Twilio SMS (use the subject field)

        format.html { redirect_to notices_url( anchor: "notice_#{ @notice.id }" ), notice: 'Notice was successfully created.' }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to @notice, notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:heading, :text, :audience, :notice_type)
    end
end
