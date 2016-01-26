json.array!(@semesters) do |semester|
  json.extract! semester, :id, :start_date, :end_date, :name, :current
  json.url semester_url(semester, format: :json)
end
