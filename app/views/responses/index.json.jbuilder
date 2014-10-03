json.array!(@responses) do |response|
  json.extract! response, :id, :user_id, :questioninstance_id, :response, :award
  json.url response_url(response, format: :json)
end
