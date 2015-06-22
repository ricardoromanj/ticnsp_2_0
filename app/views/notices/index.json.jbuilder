json.array!(@notices) do |notice|
  json.extract! notice, :id, :heading, :text, :audience, :notice_type, :text_stripped
  json.url notice_url(notice, format: :json)
end
