class Phone < ActiveRecord::Base
	belongs_to :user
  after_save :remove_blank

  def remove_blank
    if number.blank?
      puts 'called ##############################'
      self.destroy!
    end
  end

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
