json.array!(@user_responses) do |user_response|
  json.extract! user_response, :id, :response, :award, :question_instance_id, :user_id
  json.url user_response_url(user_response, format: :json)
end
