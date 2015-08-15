class Child < ActiveRecord::Base
	# Image
	attachment :image, type: :image
	
	# Markable configuration
	markable_as :responsability, by: :user
	markable_as :enrolled_workshop, by: :workshop
	markable_as :enrolled_lecture, by: :lecture
	markable_as :enrolled_shepperding, by: :shepperding

	def full_name
		"#{name} #{lastname}"
	end

	def gender_text
		gender == 'h' ? 'Niño' : 'Niña'
	end
end