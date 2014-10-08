json.array!(@admin_user_responses) do |admin_user_response|
  json.extract! admin_user_response, :id, :response, :award, :question_instance_id, :user_id
  json.url admin_user_response_url(admin_user_response, format: :json)
end
