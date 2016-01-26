class ChildSemester < ActiveRecord::Base
  belongs_to :semester
  belongs_to :child
end
