class Invoice < ActiveRecord::Base
  attr_accessible :city, :creation_date, :expiration_date, :iva, :quantity, :subtotal, :total
end
