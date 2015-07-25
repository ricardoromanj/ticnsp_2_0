class Child < ActiveRecord::Base
	# Image
	attachment :image
	
	# Markable configuration
	markable_as :reponsability, by: :user
	markable_as :enrolled_workshop, by: :workshop
  	markable_as :enrolled_lecture, by: :lecture
  	markable_as :enrolled_shepperding, by: :shepperding
end