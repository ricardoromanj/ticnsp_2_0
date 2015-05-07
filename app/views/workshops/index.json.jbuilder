json.array!(@workshops) do |workshop|
  json.extract! workshop, :id, :name, :description, :image_id
  json.url workshop_url(workshop, format: :json)
end
