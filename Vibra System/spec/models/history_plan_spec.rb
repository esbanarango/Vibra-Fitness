# == Schema Information
#
# Table name: history_plans
#
#  id                :integer(4)      not null, primary key
#  num_sessions      :integer(4)
#  last_session_date :datetime
#  expiration_date   :date
#  state             :string(255)
#  client_id         :integer(4)
#  product_id        :integer(4)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

require 'spec_helper'

describe HistoryPlan do
  pending "add some examples to (or delete) #{__FILE__}"
end
