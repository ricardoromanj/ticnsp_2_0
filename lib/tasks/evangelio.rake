namespace :evangelio do
	
	task daily: :environment do
		EvangelioMailer.daily.deliver_now	
	end

end