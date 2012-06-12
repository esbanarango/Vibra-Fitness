class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, :null => false
      t.string :last_name
      t.string :gender
      t.string :document, :null => false, :unique => true
      t.string :phone
      t.string :address
      t.string :email, :null => false, :unique => true, :limit => 255
      t.string :password_digest, :null => false
      t.string :mobile
      t.string :company
      t.string :phone_company
      t.string :position
      t.integer :seat_id, :null => false

      # Single Table Inheritance Attributes => Client or Employee
      t.string :type, :null => false

      t.timestamps
    end
  end
end
