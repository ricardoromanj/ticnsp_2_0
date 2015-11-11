class MainWebappController < WebApplicationController
  def dashboard
	@readings = Evangelizo::Reading.daypack( Date.today.strftime( '%Y%m%d' ), 'SP' )
  end
end
