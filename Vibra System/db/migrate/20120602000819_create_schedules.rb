class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :start_time, :null => false
      t.time :end_time, :null => false
      t.date :date, :null => false
      t.integer :machine_num
      t.integer :seat_id, :null => false
      t.integer :client_id

      t.timestamps
    end
     add_index :schedules, [:seat_id, :start_time, :date, :machine_num], :unique => true, :name => 'schedule_unique'
  end
end
