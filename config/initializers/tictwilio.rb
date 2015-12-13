require 'twilio-ruby' 

module TICTwilio
	
# put your own credentials here 
ACCOUNT_SID = ENV[ 'TWILIO_SID' ]
AUTH_TOKEN = ENV[ 'TWILIO_AUTH_TOKEN' ]
FROM_NUMBER = ENV[ 'TWILIO_FROM_NUMBER' ]


	class Alerts

		def initialize
			@client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'] # ACCOUNT_SID, AUTH_TOKEN 
    end

		def send_alert( msg_to, msg_body )
			@client.account.messages.create( {
				from: ENV['TWILIO_FROM_NUMBER'], # FROM_NUMBER,
				to: msg_to,
				body: msg_body
				} )
		end

	end
end
