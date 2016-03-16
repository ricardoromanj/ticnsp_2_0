class MainWebappController < WebApplicationController
  def dashboard
	  @readings = Evangelizo::Reading.daypack( Date.today.strftime( '%Y%m%d' ), 'SP' )
    @notifications = Notification.where( recipient: current_user )
    @semester = Semester.where( current: true ).first
  end

  def evangelio
  	unless params[:request_readings].blank?
  		@date = Date.strptime( params[:request_readings], '%m/%d/%Y' )
  	else
  		@date = params[:current_readings].blank? ? Date.today : Date.strptime( params[:current_readings], '%Y%m%d' )
  	end
  	@readings = Evangelizo::Reading.daypack( @date.strftime( '%Y%m%d' ), 'SP' )
  end

  def staff
    @staff = User.coordinators
  end
end
