json.array!(@admin_questions) do |admin_question|
  json.extract! admin_question, :id, :question_type, :question, :attempts, :difficulty_id
  json.url admin_question_url(admin_question, format: :json)
end
