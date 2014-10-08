json.array!(@admin_difficulties) do |admin_difficulty|
  json.extract! admin_difficulty, :id, :points
  json.url admin_difficulty_url(admin_difficulty, format: :json)
end
