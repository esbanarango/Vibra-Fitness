class HistoryPlan < ActiveRecord::Base
  attr_accessible :expiration_date, :last_session_date, :num_sessions, :state
end
