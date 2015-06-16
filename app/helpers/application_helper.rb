module ApplicationHelper
	def gravatar_url_from_email(email)
	    gravatar_id = Digest::MD5.hexdigest(email.downcase)
	    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=identicon"
	end
end
