class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name, :null => false
      t.text :description
      t.datetime :start_time, :null => false
      t.string :end_time_datetime, :null => false
      t.integer :max_age
      t.integer :min_age
      t.string :type, :null => false

      t.timestamps
    end
  end
end
