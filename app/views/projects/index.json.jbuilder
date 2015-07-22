json.array!(@projects) do |project|
  json.extract! project, :id, :end_date, :completed, :description
  json.url project_url(project, format: :json)
end
