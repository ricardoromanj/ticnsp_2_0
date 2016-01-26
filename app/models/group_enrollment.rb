class GroupEnrollment < ActiveRecord::Base
  belongs_to :group_offering
  belongs_to :enrolled, polymorphic: true

  # Validations
  validates :group_offering_id, :enrolled_id, :enrolled_type, presence: true
  validates :enrolled_type, inclusion: { in: %w( User Child ), message: "%{ value } no esta permitido" }
  validates_uniqueness_of :enrolled_type, scope: [ :enrolled_id, :group_offering_id ]
end
