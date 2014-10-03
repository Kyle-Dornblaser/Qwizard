json.array!(@user_responses) do |user_response|
  json.extract! user_response, :id, :user_id, :questioninstance_id, :response, :award
  json.url user_response_url(user_response, format: :json)
end
