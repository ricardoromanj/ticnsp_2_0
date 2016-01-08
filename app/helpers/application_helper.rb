module ApplicationHelper
	def gravatar_url_from_email(email)
	    gravatar_id = Digest::MD5.hexdigest(email.downcase)
	    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=identicon"
	end

	def user_type_display( usertype )
		if usertype =~ /^admin/
			return 'Adminsitrador'
		elsif usertype =~ /^general/
			return 'Coordinador general'
		elsif usertype =~ /^coordinator$/
			return 'Coordinador'
		else
			return 'Usuario'
		end
	end

  def text_shrinkinator( text, chars, link )
    if text.length > chars
      (text[0..chars] + link).html_safe
    else
      text
    end
  end

  def human_date( date )
    date.strftime('%b %d, %Y')
  end
end
