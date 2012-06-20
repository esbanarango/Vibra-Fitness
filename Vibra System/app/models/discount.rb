class Discount < ActiveRecord::Base
   attr_accessible :name, :percentage, :description, :seat_ids

   validates :name, presence: true
   validates :percentage, presence: true

   has_and_belongs_to_many :seats
end
