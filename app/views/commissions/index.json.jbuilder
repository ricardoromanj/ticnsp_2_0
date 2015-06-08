json.array!(@commissions) do |commission|
  json.extract! commission, :id, :name, :description, :image_id
  json.url commission_url(commission, format: :json)
end
