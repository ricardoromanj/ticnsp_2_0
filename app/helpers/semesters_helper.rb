module SemestersHelper
  def semester_progress( semester )
    total_days = (semester.end_date.to_date - semester.start_date.to_date).round
    current_days = (Date.today - semester.start_date.to_date).round
    return [ [ ( current_days / total_days.to_f ) * 100, 100 ].min, 0 ].max
  end
end
