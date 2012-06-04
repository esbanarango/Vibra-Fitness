class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :num_sessions, :null => false
      t.decimal :price, :null => false, :precision => 12, :scale => 3
      t.decimal :cash_price, :null => false, :precision => 12, :scale => 3
      t.integer :expiration, :null => false
      t.integer :discount_pct
      t.integer :num_pqt_fidelity
      t.integer :plan_id, :null => false

      t.timestamps
    end
  end
end
