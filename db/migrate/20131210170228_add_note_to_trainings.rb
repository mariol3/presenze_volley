class AddNoteToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :note, :text
  end
end
