
require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user=User.create(username:'john', password:'password')		
		@user=User.new(username:'michal', password:'password')
	end


	test "user should be valid"  do
		assert @user.valid?
	end

	test 'username should be presence ' do
		@user.username=''
		assert_not @user.valid?

	end


	test "uername should be unique " do
		@user.username='john'
		assert_not @user.valid?

	end




end