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

class Plan < ActiveRecord::Base
  attr_accessible :description, :end_time, :max_age, :min_age, :name, :start_time, :plan_type

  has_many :products

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :plan_type, presence: true


end
