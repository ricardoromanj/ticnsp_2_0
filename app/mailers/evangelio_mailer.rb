class EvangelioMailer < ApplicationMailer

	def daily
		@daypack = Evangelizo::Reading.daypack( Date.today.strftime( "%Y%m%d" ), 'SP' )
		mail(to: ["admin@ticnsp.org"], subject: "El Evangelio del día de hoy, #{ Date.today.strftime( "%b %d, %Y" ) }")
	end
end
