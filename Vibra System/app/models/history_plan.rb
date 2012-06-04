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

class HistoryPlan < ActiveRecord::Base
  attr_accessible :expiration_date, :last_session_date, :num_sessions, :state
end
