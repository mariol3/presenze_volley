class AddNoteToParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :note, :text
  end
end
