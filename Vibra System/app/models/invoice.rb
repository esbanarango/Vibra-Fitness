# == Schema Information
#
# Table name: invoices
#
#  id              :integer(4)      not null, primary key
#  creation_date   :date
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
  attr_accessible :city, :creation_date, :expiration_date, :iva, :quantity, :subtotal, :total
  
end
