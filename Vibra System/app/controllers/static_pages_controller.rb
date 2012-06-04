class StaticPagesController < ApplicationController

	def home
		redirect_to(signin_url) unless current_user
	end

	def about
	end

	def error
		session[:employee_id] = nil
		render :layout => "error_layout"		
	end

end