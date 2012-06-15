class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name, :null => false
      t.text :description
      t.time :start_time, :null => false
      t.time :end_time, :null => false
      t.integer :max_age
      t.integer :min_age
      t.string :plan_type, :null => false

      t.timestamps
    end
  end
end
