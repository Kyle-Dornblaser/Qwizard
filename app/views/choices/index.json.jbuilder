json.array!(@choices) do |choice|
  json.extract! choice, :id, :choice, :correct_choice, :question_id
  json.url choice_url(choice, format: :json)
end
