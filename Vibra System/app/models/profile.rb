# == Schema Information
#
# Table name: profiles
#
#  id                           :integer(4)      not null, primary key
#  first_name                   :string(255)     not null
#  last_name                    :string(255)
#  document                     :string(255)     not null
#  phone                        :string(255)
#  address                      :string(255)
#  email                        :string(255)     not null
#  password_digest              :string(255)     not null
#  mobile                       :string(255)
#  company                      :string(255)
#  phone_company                :string(255)
#  position                     :string(255)
#  seat_id                      :integer(4)      not null
#  type                         :string(255)     not null
#  created_at                   :datetime        not null
#  updated_at                   :datetime        not null
#  profile_picture_file_name    :string(255)
#  profile_picture_content_type :string(255)
#  profile_picture_file_size    :integer(4)
#  profile_picture_updated_at   :datetime
#

class Profile < ActiveRecord::Base
  attr_accessible :address, :company, :document, :email, :first_name, :last_name, :mobile, :password, :password_confirmation, :phone, :phone_company, :position, :seat_id

  attr_accessible :profile_picture 
  has_attached_file :profile_picture, :styles => { :small => "100x100>", :medium => "300x300>", :large => "400x400>" }

  # VALIDATIONS
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :document, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :seat_id, presence: true
  validates :email, :presence => true, length: { maximum: 255 }, :format => { with: VALID_EMAIL_REGEX },
					  :uniqueness => { case_sensitive: false }

  has_secure_password					  
					  
  before_save { |profile| profile.email = email.downcase }

end
