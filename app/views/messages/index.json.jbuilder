json.array!(@messages) do |message|
  json.extract! message, :id, :text, :timestamp
  json.url message_url(message, format: :json)
end
