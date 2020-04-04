require 'test_helper'


class MessagesControllerTest <  ActionDispatch::IntegrationTest


	def setup
		@user=User.create( username:"Max", password:"password" )
	end

	test "should get chatroom index" do
		sign_in_as(@user,"password" )
		get root_path
		assert_response :success

	end


end