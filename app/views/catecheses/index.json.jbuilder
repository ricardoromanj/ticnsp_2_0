json.array!(@catecheses) do |catechese|
  json.extract! catechese, :id, :name, :description, :image_id
  json.url catechese_url(catechese, format: :json)
end
