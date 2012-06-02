class Profile < ActiveRecord::Base
  attr_accessible :address, :company, :document, :email, :first_name, :last_name, :mobile, :password_digest, :phone, :phone_company, :position

  attr_accessible :profile_picture 
  has_attached_file :profile_picture, :styles => { :small => "100x100>", :medium => "300x300>", :large => "400x400>" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, length: { maximum: 255 }, :format => { with: VALID_EMAIL_REGEX },
					  :uniqueness => { case_sensitive: false }
					  
  before_save { |profile| profile.email = email.downcase }

end
