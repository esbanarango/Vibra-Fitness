# == Schema Information
#
# Table name: seats
#
#  id                        :integer(4)      not null, primary key
#  name                      :string(255)     not null
#  address                   :string(255)
#  phone                     :string(255)
#  num_machines              :integer(4)      not null
#  created_at                :datetime        not null
#  updated_at                :datetime        not null
#  seat_picture_file_name    :string(255)
#  seat_picture_content_type :string(255)
#  seat_picture_file_size    :integer(4)
#  seat_picture_updated_at   :datetime
#

require 'spec_helper'

describe Seat do
  pending "add some examples to (or delete) #{__FILE__}"
end
