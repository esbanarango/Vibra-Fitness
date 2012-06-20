class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :percentage, :null => false
      t.timestamps
    end
  end
end
