# == Schema Information
#
# Table name: plans
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)     not null
#  description       :text
#  start_time        :datetime        not null
#  end_time_datetime :string(255)     not null
#  max_age           :integer(4)
#  min_age           :integer(4)
#  type              :string(255)     not null
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class Plan < ActiveRecord::Base
  attr_accessible :description, :end_time_datetime, :max_age, :min_age, :name, :start_time, :type
end
