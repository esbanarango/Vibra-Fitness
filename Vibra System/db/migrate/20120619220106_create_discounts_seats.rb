class CreateDiscountsSeats < ActiveRecord::Migration
  def change
    create_table :discounts_seats, :id => false do |t|
    	t.integer :discount_id
      	t.integer :seat_id
      t.timestamps
    end
  end
end
