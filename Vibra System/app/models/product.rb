# == Schema Information
#
# Table name: products
#
#  id               :integer(4)      not null, primary key
#  num_sessions     :integer(4)      not null
#  price            :decimal(12, 3)  not null
#  cash_price       :decimal(12, 3)  not null
#  expiration       :integer(4)      not null
#  discount_pct     :integer(4)
#  num_pqt_fidelity :integer(4)
#  plan_id          :integer(4)      not null
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :cash_price, :discount_pct, :expiration, :num_pqt_fidelity, :num_sessions, :price, :plan_id

  has_many :historyPlans
  has_many :invoices
  belongs_to :plan

  validates :num_sessions, presence: true
  validates :price, presence: true
  validates :cash_price, presence: true
  validates :expiration, presence: true
  validates :plan_id, presence: true


end
