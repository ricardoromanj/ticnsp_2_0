class EvangelioMailer < ApplicationMailer

	def daily
		@daypack = Evangelizo::Reading.daypack( Date.today.strftime( "%Y%m%d" ), 'SP' )
		mail(to: [ENV['TICNSP_EVANGELIO_DIST']], subject: "El Evangelio del día de hoy, #{ Date.today.strftime( "%b %d, %Y" ) }")
	end
end
