# == Schema Information
#
# Table name: machines
#
#  id          :integer(4)      not null, primary key
#  client_id   :integer(4)
#  schedule_id :integer(4)
#  machine_num :integer(4)
#

class Machine < ActiveRecord::Base


  attr_accessible :machine_num, :schedule_id, :client_id

  belongs_to :client
  belongs_to :schedule



end
