json.array!(@events) do |event|
  json.extract! event, :id, :name, :date_start, :date_end, :description, :latitude, :longitude, :location, :audience
  json.url event_url(event, format: :json)
  json.start_date do
    json.day event.date_start.day
    json.month event.date_start.month
    json.year event.date_start.year
    json.hour event.date_start.hour
    json.minute event.date_start.min
  end
  json.end_date do
    json.day event.date_end.day
    json.month event.date_end.month
    json.year event.date_end.year
    json.hour event.date_end.hour
    json.minute event.date_end.min
  end
end
