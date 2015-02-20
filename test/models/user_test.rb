require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should enter a first name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "user should have a unique profile nmae" do
  	user = User.new
  	user.profile_name = 'abinash'
  	user.email = 'abinash1354@gmail.com'
  	user.first_name = "kumar"
  	user.last_name = "abinash"
  	assert !user.save
  	assert user.errors[:profile_name].empty?
  end
end
