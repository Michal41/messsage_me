class UsersController < ApplicationController
		

	def new
		@user=User.new
	end


	def create
		@user=User.new(user_params)
		if @user.save
			flash[:info]='You have ben sucessfully signed up'
			session[:user_id]=@user.id
		end
		redirect_to root_path
	end


	private
	def user_params
		params.require(:user).permit(:username, :password)
	end

end