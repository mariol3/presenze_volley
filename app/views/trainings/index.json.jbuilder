json.array!(@trainings) do |training|
  json.extract! training, :date
  json.url training_url(training, format: :json)
end
