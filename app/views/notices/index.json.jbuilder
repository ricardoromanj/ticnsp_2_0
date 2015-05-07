json.array!(@notices) do |notice|
  json.extract! notice, :id, :heading, :text, :audience, :notice_type
  json.url notice_url(notice, format: :json)
end
