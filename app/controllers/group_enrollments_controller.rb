class GroupEnrollmentsController < WebApplicationController
  before_action :set_group_enrollment, only: [:destroy]

  def create
    group = GroupOffering.find( group_enrollment_params[:group_offering_id] ).group
    @group_enrollment = GroupEnrollment.new( group_enrollment_params )
    if @group_enrollment.save
      respond_to do |format|
        format.html { redirect_to group, notice: 'Asignado a taller' }
        format.json { head 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to group, alert: 'No se pudo inscribir' }
        format.json { head 402 }
      end
    end
  end

  def destroy
    group = @group_enrollment.group_offering.group
    @group_enrollment.destroy
    respond_to do |format|
      format.html { redirect_to group, notice: 'Niño desasignado de taller' }
      format.json { head :no_content }
    end
  end

  private
    def set_group_enrollment
      @group_enrollment = GroupEnrollment.find( params[:id] )
    end

    def group_enrollment_params
      params.require( :group_enrollment ).permit( :group_offering_id, :enrolled_type, :enrolled_id )
    end
end
