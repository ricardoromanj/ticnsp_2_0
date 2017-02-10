class GroupOffering < ActiveRecord::Base
  belongs_to :semester
  belongs_to :group, polymorphic: true
  has_many :group_enrollments
  validates :group_id, presence: true
  validates :semester_id, presence: true
end
