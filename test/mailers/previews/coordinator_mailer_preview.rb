# Preview all emails at http://localhost:3000/rails/mailers/coordinator_mailer
class CoordinatorMailerPreview < ActionMailer::Preview
	def welcome_coordinator
		CoordinatorMailer.welcome_coordinator( User.where(usertype: 'coordinator').first, 'test1234' ).deliver_now
	end
end
