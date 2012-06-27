# == Schema Information
#
# Table name: schedules
#
#  id         :integer(4)      not null, primary key
#  start_time :time            not null
#  end_time   :time            not null
#  date       :date            not null
#  seat_id    :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Schedule do
  pending "add some examples to (or delete) #{__FILE__}"
end
