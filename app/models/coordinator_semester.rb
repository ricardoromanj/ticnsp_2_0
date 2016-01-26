class CoordinatorSemester < ActiveRecord::Base
  belongs_to :semester
  belongs_to :coordinator, class_name: 'User'
end
