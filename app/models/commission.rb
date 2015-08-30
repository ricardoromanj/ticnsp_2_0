class Commission < ActiveRecord::Base
	attachment :image
	acts_as_marker
end
