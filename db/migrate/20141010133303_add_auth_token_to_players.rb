class AddAuthTokenToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :auth_token, :string

    Player.all.each do |player|
      player.auth_token = generate_token()
      player.save!
    end
  end

  def self.down
    remove_column :players, :auth_token
  end

  def generate_token()
    token = ''
    begin
      token = SecureRandom.urlsafe_base64
    end while Player.exists?(:auth_token => token)
    token
  end
end
