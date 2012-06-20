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

class Seat < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :num_machines

  attr_accessible :seat_picture 
  has_attached_file :seat_picture, :styles => { :small => "100x100>", :medium => "300x300>", :large => "400x400>" }

  # VALIDATIONS
  validates :name, presence: true
  validates :num_machines, presence: true



  has_many :schedules

  has_and_belongs_to_many :discounts

end
