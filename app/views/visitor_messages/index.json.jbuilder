json.array!(@visitor_messages) do |visitor_message|
  json.extract! visitor_message, :id, :name, :email, :message_text, :read, :read_at, :replied, :replied_at, :replied_by_user_id
  json.url visitor_message_url(visitor_message, format: :json)
end
