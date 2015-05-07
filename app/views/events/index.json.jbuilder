json.array!(@events) do |event|
  json.extract! event, :id, :name, :date_start, :date_end, :description, :latitude, :longitude, :location, :audience
  json.url event_url(event, format: :json)
end
