class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.String :name
      t.String :password_digest
      t.String :avatar_url

      t.timestamps
    end
  end
end
