class SessionsController < ApplicationController

	def new
		render :layout => 'signin_layout'
  	end

  	def create
  		employee = Employee.find_by_email(params[:session][:email])
      	if employee && employee.authenticate(params[:session][:password])
      		session[:employee_id] = employee.id
      		redirect_to root_url, :flash => { :success => "Bienvenido #{employee.first_name}" }
      	else
      		flash.now[:error] = "Email/contrasenha incorrecto. Vuelva a intentarlo"
      		render action: "new", :layout => 'signin_layout'
      	end
  	end

  	def destroy
  		session[:employee_id] = nil
    	redirect_to root_url
  	end
end
