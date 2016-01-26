json.array!(@coordinator_semesters) do |coordinator_semester|
  json.extract! coordinator_semester, :id, :coordinator_id, :semester_id, :notes
  json.url coordinator_semester_url(coordinator_semester, format: :json)
end
