# == Schema Information
#
# Table name: discounts
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)     not null
#  description :text
#  percentage  :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Discount < ActiveRecord::Base
   attr_accessible :name, :percentage, :description, :seat_ids

   validates :name, presence: true
   validates :percentage, presence: true

   has_and_belongs_to_many :seats
end
