# == Schema Information
#
# Table name: schedules
#
#  id          :integer(4)      not null, primary key
#  start_time  :time            not null
#  end_time    :time            not null
#  date        :date            not null
#  machine_num :integer(4)      not null
#  seat_id     :integer(4)      not null
#  client_id   :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Schedule < ActiveRecord::Base
  attr_accessible :date, :end_time, :machine_num, :start_time
  
  belongs_to :client
  belongs_to :seat

end
