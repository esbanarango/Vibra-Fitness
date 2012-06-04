class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :creation_date
      t.date :expiration_date
      t.string :city
      t.decimal :subtotal, :precision => 12, :scale => 2
      t.integer :iva
      t.decimal :total, :precision => 12, :scale => 2
      t.integer :quantity

      t.integer :client_id
      t.integer :employee_id
      t.integer :product_id

      t.timestamps
    end
  end
end
