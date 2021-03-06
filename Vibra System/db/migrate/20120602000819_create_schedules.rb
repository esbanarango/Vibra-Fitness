class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :start_time, :null => false
      t.time :end_time, :null => false
      t.date :date, :null => false
      t.integer :seat_id, :null => false

      t.timestamps
    end
     add_index :schedules, [:seat_id, :start_time, :date], :unique => true, :name => 'schedule_unique'
  end
end
