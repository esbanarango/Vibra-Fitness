class Seat < ActiveRecord::Base
  attr_accessible :name, :num_machines, :phone

  attr_accessible :seat_picture 
  has_attached_file :seat_picture, :styles => { :small => "100x100>", :medium => "300x300>", :large => "400x400>" }

end
