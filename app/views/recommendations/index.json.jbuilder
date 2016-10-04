json.array!(@recommendations) do |recommendation|
  json.extract! recommendation, :id, :title, :url, :picture_url, :feature_one, :feature_two, :feature_three
  json.url recommendation_url(recommendation, format: :json)
end
