class AddPresentToParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :present, :boolean
  end
end
