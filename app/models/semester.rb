class Semester < ActiveRecord::Base
  has_many :coordinator_semesters
  has_many :child_semesters
  has_many :group_offerings
  has_many :group_enrollments

  scope :current_first, -> { order( start_date: :desc ) }
end
