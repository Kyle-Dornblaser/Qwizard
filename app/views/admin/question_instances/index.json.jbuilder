json.array!(@admin_question_instances) do |admin_question_instance|
  json.extract! admin_question_instance, :id, :question_id
  json.url admin_question_instance_url(admin_question_instance, format: :json)
end
