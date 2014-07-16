json.array!(@messages) do |message|
  json.extract! message, :id, :sender_email, :content
  json.url message_url(message, format: :json)
end
