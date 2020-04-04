require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest

	test "sing up user test" do

		get signup_path
		assert_template 'users/new'
		assert_difference "User.count",1 do
			post signup_path params:{user:{username:"michal",password:"password"}}
			follow_redirect!
		end
		assert_template 'chatroom/index'
	end






	test "should not signup user with invalid credentials" do

		get signup_path
		assert_template 'users/new'
		assert_no_difference "User.count" do
			post signup_path params:{user:{username:"",password:"password"}}
		end
		assert_template 'users/new'
	end

end