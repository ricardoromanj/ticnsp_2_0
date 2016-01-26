json.array!(@child_semesters) do |child_semester|
  json.extract! child_semester, :id, :child_id, :semester_id, :paid, :notes
  json.url child_semester_url(child_semester, format: :json)
end
