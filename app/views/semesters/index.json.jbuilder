json.array!(@semesters) do |semester|
  json.extract! semester, :id, :name, :date_start, :date_end
  json.url semester_url(semester, format: :json)
end
