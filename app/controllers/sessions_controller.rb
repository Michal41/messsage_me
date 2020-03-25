class SessionsController < ApplicationController

	def new

	end

	def create
		user=User.find_by(username:params[:session][:username])
		if (user && user.authenticate(params[:session][:password]))
			session[:user_id]=user.id
			flash[:info]='You have ben sucessfully logged in'
			redirect_to root_path
		else
			flash.now[:negative]='Incorect password or username '
			render 'new'
		end
	end

	def destroy
		session[:user_id]= nil
		redirect_to root_path
	end


	private
	def session_params
    	params.require(:session).permit(:username, :password)
	end



end