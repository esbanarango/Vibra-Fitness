# == Schema Information
#
# Table name: invoices
#
#  id              :integer(4)      not null, primary key
#  expiration_date :date
#  city            :string(255)
#  subtotal        :decimal(12, 2)
#  iva             :integer(4)
#  total           :decimal(12, 2)
#  quantity        :integer(4)
#  client_id       :integer(4)
#  employee_id     :integer(4)
#  product_id      :integer(4)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Invoice < ActiveRecord::Base
  attr_accessible :city, :expiration_date, :iva, :quantity, :subtotal, :total
  
  belongs_to :client
  belongs_to :employee
  belongs_to :product

end
