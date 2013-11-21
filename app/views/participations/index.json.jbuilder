json.array!(@participations) do |participation|
  json.extract! participation, :player_id, :training_id
  json.url participation_url(participation, format: :json)
end
