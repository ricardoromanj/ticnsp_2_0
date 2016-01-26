json.array!(@group_offerings) do |group_offering|
  json.extract! group_offering, :id, :group_id, :group_type, :semester_id
  json.url group_offering_url(group_offering, format: :json)
end
