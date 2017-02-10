class ChildSemester < ActiveRecord::Base
  belongs_to :semester
  belongs_to :child
  validates :child_id, presence: true
  validates :semester_id, presence: true
end
