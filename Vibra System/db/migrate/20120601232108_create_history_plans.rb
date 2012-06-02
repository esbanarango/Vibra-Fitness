class CreateHistoryPlans < ActiveRecord::Migration
  def change
    create_table :history_plans do |t|
      t.integer :num_sessions
      t.datetime :last_session_date
      t.date :expiration_date
      t.string :state
      t.integer :client_id
      t.integer :product_id

      t.timestamps
    end
  end
end
