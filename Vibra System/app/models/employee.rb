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

class Employee < Profile

	#Associations

end
