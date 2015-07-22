json.array!(@tasks) do |task|
  json.extract! task, :id, :end_date, :completed, :description, :project_id
  json.url task_url(task, format: :json)
end
