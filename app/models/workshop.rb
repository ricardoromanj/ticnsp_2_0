class Workshop < ActiveRecord::Base
	attachment :image, type: :image
	acts_as_marker
end
