class Lecture < ActiveRecord::Base
	attachment :image, type: :image
	acts_as_marker

  has_many :group_offerings, as: :group

  def children_enrolled_on_semester( semester )
    gos = group_offerings.find_by_semester_id( semester.id )
    if gos
      gos.group_enrollments.where( enrolled_type: 'Child' )
    else
      []
    end
  end

  def coordinators_enrolled_on_semester( semester )
    gos = group_offerings.find_by_semester_id( semester.id )
    if gos
      gos.group_enrollments.where( enrolled_type: 'User')
    else
      []
    end
  end

end
