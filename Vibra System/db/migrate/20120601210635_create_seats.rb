class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :name, :null => false
      t.string :address
      t.string :phone
      t.integer :num_machines, :null => false

      t.timestamps
    end
  end
end
