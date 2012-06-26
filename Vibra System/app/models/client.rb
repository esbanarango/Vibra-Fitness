# == Schema Information
#
# Table name: profiles
#
#  id                           :integer(4)      not null, primary key
#  first_name                   :string(255)     not null
#  last_name                    :string(255)
#  gender                       :string(255)
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

class Client < Profile

	after_create :confirmation_and_welcome_notification

	has_many :schedules
	has_many :historyPlans
	has_many :invoices


	acts_as_api

  	# Template for basic client info
  	api_accessible :booking_clients do |template|
  		template.add :id
  		template.add :first_name
	    template.add :last_name
	    template.add :document
	    template.add :email
	    template.add :anyPlanActive?, :as => :active
	    template.add :plan_name
	end


	# Public methods for ac_as_api
	def plan_name
		actualPlan = self.historyPlans.where('state = \'Activo\'').limit(1)
		if actualPlan.size > 0
			actualPlan[0].product.plan.name
		else
			"Ninguno"
		end
	end


	def generate_password
	    password = random_password
		self.password = password
		self.password_confirmation =password
	end

	def anyPlanActive?
		return true if self.historyPlans.where('state = \'Activo\'').count > 0
		return false		
	end

	private

	def confirmation_and_welcome_notification
		#ClientMailer.registration_confirmation(self).deliver		
	end

	private

	def random_password(size = 6)
	  chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
	  (1..size).collect{|a| chars[rand(chars.size)] }.join
	end

end
