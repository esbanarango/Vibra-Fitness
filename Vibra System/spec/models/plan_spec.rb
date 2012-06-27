# == Schema Information
#
# Table name: plans
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)     not null
#  description :text
#  start_time  :time            not null
#  end_time    :time            not null
#  max_age     :integer(4)
#  min_age     :integer(4)
#  plan_type   :string(255)     not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Plan do
  pending "add some examples to (or delete) #{__FILE__}"
end
