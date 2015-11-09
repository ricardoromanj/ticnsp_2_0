class CoordinatorMailer < ApplicationMailer

	def welcome_coordinator(coordinator, init_password)
		@coordinator = coordinator
		@url = "http://ticnsp.org/users/sign_in"
		@init_password = init_password
		mail(to: ["#{@coordinator.email}","admin@ticnsp.org"], subject: 'Bienvenido al portal de TIC')
	end

	def notice_coordinator(coordinator, notice)

	end
end
