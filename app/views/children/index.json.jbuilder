json.array!(@children) do |child|
  json.extract! child, :id, :name, :lastname, :gender, :birthdate, :image_id, :allergies, :notes
  json.url child_url(child, format: :json)
end
