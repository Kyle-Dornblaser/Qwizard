json.array!(@questions) do |question|
  json.extract! question, :id, :question_type, :question, :attempts, :difficulty_id
  json.url question_url(question, format: :json)
end
