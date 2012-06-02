class Plan < ActiveRecord::Base
  attr_accessible :description, :end_time_datetime, :max_age, :min_age, :name, :start_time, :type
end
