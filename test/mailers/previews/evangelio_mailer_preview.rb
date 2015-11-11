# Preview all emails at http://localhost:3000/rails/mailers/evangelio_mailer
class EvangelioMailerPreview < ActionMailer::Preview
	def daily
		EvangelioMailer.daily.deliver_now
	end
end
