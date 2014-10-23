class AddDisplayNameToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :display_name, :string

    Player.all.each do |player|
      player.display_name = player.name
      player.save!
    end
  end

  def self.down
    remove_column :players, :display_name
  end
end
