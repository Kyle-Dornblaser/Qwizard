json.array!(@admin_choices) do |admin_choice|
  json.extract! admin_choice, :id, :choice, :correct_choice, :question_id
  json.url admin_choice_url(admin_choice, format: :json)
end
