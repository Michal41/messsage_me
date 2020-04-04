require 'test_helper'

class SigninUserTest < ActionDispatch::IntegrationTest

	def setup
		@user=User.create(username:'michal',password:'password')
	end

	test "sing in user test" do

		get login_path
		assert_template 'sessions/new'
		post login_path params:{session:{username:"michal",password:"password"}}
		follow_redirect!
		assert !!session[:user_id]
		assert_template 'chatroom/index'
		
	end


		test "should not log in with incorect credentials " do

		get login_path
		assert_template 'sessions/new'
		post login_path params:{session:{username:"xxx",password:"xx"}}
		assert_not !!session[:user_id]
		assert_template 'sessions/new'
		
	end





end