class AddRoleToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :role, :string
    
    Player.all.each do |player|
      player.role = Player::ROLES[0]
      player.save!
    end
  end
end
