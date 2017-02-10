class CoordinatorSemester < ActiveRecord::Base
  belongs_to :semester
  belongs_to :coordinator, class_name: 'User'
  validates :coordinator_id, presence: true
  validates :semester_id, presence: true
end
