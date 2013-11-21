json.array!(@players) do |player|
  json.extract! player, :name, :password_digest, :avatar_url
  json.url player_url(player, format: :json)
end
