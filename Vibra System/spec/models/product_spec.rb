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

require 'spec_helper'

describe Product do
  pending "add some examples to (or delete) #{__FILE__}"
end
