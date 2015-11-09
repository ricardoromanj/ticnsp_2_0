class UsersController < WebApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_sidebar, :edit_tutor, :edit_coordinator, :assign_to_workshop, :unassign_from_workshop, :assign_to_lecture, :unassign_from_lecture, :assign_to_shepperding, :unassign_from_shepperding, :assign_to_commission, :unassign_from_commission]

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
    users = User.select(:id, :name, :lastname)
    if params[:usertype]
      users = users.where(usertype: params[:usertype]).map { |u| { id: u.id, name: "#{u.name} #{u.lastname}"} }
    end
    render json: users, status: 200
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users/1/assign_to_workshop
  def assign_to_workshop
    workshop = Workshop.find(params[:workshop_id])
    workshop.mark_as_coordinator_workshop @user
    redirect_to @user, notice: 'Coordinador ha sido asignado al taller'
  end

  # DELETE /users/1/unassign_from_workshop
  def unassign_from_workshop
    workshop = Workshop.find(params[:workshop_id])
    workshop.remove_mark :coordinator_workshop, @user
    redirect_to @user, alert: 'Coordinador ya no está asignado al taller seleccionado'
  end

  # POST /users/1/assign_to_lecture
  def assign_to_lecture
    lecture = Lecture.find(params[:lecture_id])
    lecture.mark_as_coordinator_lecture @user
    redirect_to @user, notice: 'Coordinador ha sido asignado a la catequesis'
  end

  # DELETE /users/1/unassign_from_lecture
  def unassign_from_lecture
    lecture = Lecture.find(params[:lecture_id])
    lecture.remove_mark :coordinator_lecture, @user
    redirect_to @user, alert: 'Coordinador ya no está asignado a la catequesis seleccionad'
  end

  # POST /users/1/assign_to_shepperding
  def assign_to_shepperding
    shepperding = Shepperding.find(params[:shepperding_id])
    shepperding.mark_as_coordinator_shepperding @user
    redirect_to @user, notice: 'Coordinador ha sido asignado al acompañamiento'
  end

  # DELETE /users/1/unassign_from_shepperding
  def unassign_from_shepperding
    shepperding = Shepperding.find(params[:shepperding_id])
    shepperding.remove_mark :coordinator_shepperding, @user
    redirect_to @user, alert: 'Coordinador ya no está asignado al acompañamiento seleccionado'
  end

  # POST /users/1/assign_to_commission
  def assign_to_commission
    commission = Commission.find(params[:commission_id])
    commission.mark_as_coordinator_commission @user
    redirect_to @user, notice: 'Coordinador ha sido asignado a la comisión'
  end

  # DELETE /users/1/unassign_from_commission
  def unassign_from_commission
    commission = Commission.find(params[:commission_id])
    commission.remove_mark :coordinator_commission, @user
    redirect_to @user, alert: 'Coordinador ya no está asignado a la comisión seleccionada'
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
    2.times { @user.phones.build }
  end

  # GET /users/coordinator
  def new_coordinator
    @user = User.new(usertype: 'coordinator')
    2.times { @user.phones.build }
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1/edit_tutor
  def edit_tutor
    2.times { @user.phones.build }
  end

  # GET /users/1/edit_coordinator
  def edit_coordinator
    2.times { @user.phones.build }
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    temp_password = SecureRandom.hex[0,15]
    @user.password = temp_password
    @user.password_confirmation = temp_password

    use_gravatar = params[:user][:image_source] =~ /^gravatar$/ ? true : false
    @user.use_gravatar = use_gravatar
    
    respond_to do |format|
      if @user.save

        # Send the wolcome email with temp password
        CoordinatorMailer.welcome_coordinator(@user, temp_password).deliver_now

        format.html { redirect_to @user, notice: "#{@user.usertype.capitalize} was successfully created with password #{temp_password}" }
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
    use_gravatar = params[:user][:image_source] =~ /^gravatar$/ ? true : false
    @user.use_gravatar = use_gravatar

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "#{@user.usertype.capitalize} was successfully updated" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/profile
  def profile
    @user = current_user
    2.times { @user.phones.build }
  end

  # PATCH/PUT /users/change_password
  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      sign_in @user, bypass: true
      redirect_to profile_users_path, notice: 'Contraseña actualizada'
    else
      redirect_to profile_users_path, alert: 'Tu contraseña no pudo ser actualizada'
    end
  end

  # PATCH/PUT /users/update_profile
  def update_profile
    @user = User.find(current_user.id)
    use_gravatar = params[:user][:image_source] =~ /^gravatar$/ ? true : false
    @user.use_gravatar = use_gravatar

    if @user.update(user_params)
      redirect_to profile_users_path, notice: 'Perfil actualizado.'
    else
      redirect_to profile_users_path, alert: 'Tu perfil no pudo ser guardado.'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    usertype = @user.usertype
    redirect_path = ''
    if usertype =~ /tutor/
      redirect_path = '/users/tutors'
    elsif usertype =~ /coordinator/
      redirect_path = '/users/coordinators'
    end

    @user.destroy
    respond_to do |format|
      format.html { redirect_to redirect_path, notice:  "#{usertype.capitalize} was successfully destroyed" }
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
      params.require(:user).permit(:email, :usertype, :name, :lastname, :gender, :role, :birthdate, :username, :image, :notes, :password, :password_confirmation, :current_password, phones_attributes: [:id, :number, :phone_type, :_destroy])
    end
end
