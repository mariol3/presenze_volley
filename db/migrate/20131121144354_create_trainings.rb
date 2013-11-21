class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.Date :date

      t.timestamps
    end
  end
end
