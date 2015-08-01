class UsersController < WebApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_sidebar, :edit_tutor, :edit_coordinator]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/tutors
  def tutors
    respond_to do |format|
      format.html
      format.json { render json: TutorDatatable.new(view_context) }
    end
  end

  # GET /users/coordinators
  def coordinators
    respond_to do |format|
      format.html
      format.json { render json: CoordinatorDatatable.new(view_context) }
    end
  end

  # GET /users/typeaheaddata.json
  def typeaheaddata
    render json: User.select(:id, :name), status: 200
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users/1/toggle_sidebar
  def toggle_sidebar
    render json: @user.set_setting(:sidebar_toggled, !@user.settings[:sidebar_toggled]), status: 200
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/new_tutor
  def new_tutor
    @user = User.new(usertype: 'tutor')
  end

  # GET /users/coordinator
  def new_coordinator
    @user = User.new(usertype: 'coordinator')
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1/edit_tutor
  def edit_tutor
  end

  # GET /users/1/edit_coordinator
  def edit_coordinator
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(admin_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(admin_params)
        format.html { redirect_to @user, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :usertype)
    end
end
