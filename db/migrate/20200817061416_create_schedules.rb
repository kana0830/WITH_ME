class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.text :content
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id, null: false
      t.integer :gelande_id

      t.timestamps
    end
  end
end
