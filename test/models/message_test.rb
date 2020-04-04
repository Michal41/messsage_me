
require 'test_helper'

class MessageTest < ActiveSupport::TestCase

	def setup
		@user=User.create(username:'john', password:'password')		
		@message=Message.new( body:"this is body for test message", user: @user)
	end


	test "message should be valid"  do
		assert @message.valid?
	end

	test "message should't valid with empty body" do
		@message.body=""
		assert_not @message.valid?
	end


	test "message shuldnt't be create without user" do

		@message.body="asdfasdf"
		@message.user = nil
		assert_not @message.valid?
	end

end