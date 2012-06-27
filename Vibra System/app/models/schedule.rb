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

class Schedule < ActiveRecord::Base

	default_scope :order => 'start_time'

  attr_accessible :date, :end_time, :machine_num, :start_time, :seat_id
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
  validates :seat_id, presence: true
  
  has_many :machines, :dependent => :destroy
  has_many :clients, :through => :machines
  belongs_to :seat

  def same_hours?
  	seat = Seat.find(self.seat_id)
		sameHour = seat.schedules.where("date = ? and ((start_time < ? and ? < end_time) or (start_time < ? and ? < end_time) or (start_time >= ? and ? >= end_time) or start_time = ? or ? = end_time )",self.date, self.end_time.to_s ,self.end_time.to_s, self.start_time.to_s, self.start_time.to_s, self.start_time.to_s ,self.end_time.to_s, self.start_time.to_s , self.end_time.to_s  ).count
		sameHour > 0		
  end


end
