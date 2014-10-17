json.array!(@question_instances) do |question_instance|
  json.extract! question_instance, :id, :question_id
  json.url question_instance_url(question_instance, format: :json)
end
