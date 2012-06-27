# == Schema Information
#
# Table name: discounts
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)     not null
#  description :text
#  percentage  :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Discount do
  pending "add some examples to (or delete) #{__FILE__}"
end
