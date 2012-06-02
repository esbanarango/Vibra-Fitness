class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :num_machines

      t.timestamps
    end
  end
end
