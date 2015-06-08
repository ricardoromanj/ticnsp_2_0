json.array!(@shepperdings) do |shepperding|
  json.extract! shepperding, :id, :name, :description, :image_id
  json.url shepperding_url(shepperding, format: :json)
end
