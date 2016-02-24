class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase )
		if user && user.authenticate(params[:session][:password])
			flash[:success] = "You have successfully logged in"
			session[:user_id] = user.id
			redirect_to root_path
		else
			flash.now[:danger] = "Username or Password is incorrect"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Logged out successfully"
		redirect_to root_path
	end
end