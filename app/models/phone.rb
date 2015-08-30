class Phone < ActiveRecord::Base
	belongs_to :user

	def phone_type_display
		case phone_type
		when 'mobile'
			"Móvil"
		when 'home'
			"Casa"
		when 'office'
			"Oficina"
		else
			"Otro"
		end
	end
end
