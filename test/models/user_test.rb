require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should enter a first name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  should have_many(:user_friendships)
  should have_many(:friends)

  test "user should have a unique profile nmae" do
  	user = User.new
  	user.profile_name = 'abinash'
  	user.email = 'abinash1354@gmail.com'
  	user.first_name = "kumar"
  	user.last_name = "abinash"
  	assert !user.save
  	assert user.errors[:profile_name].empty?
  end

  test "that no error is rasised when trying to access a friend list " do
    assert_nothing_raised do
      users(:kumar).friends
    end
  end

  test "that creating a friendhips on a user workds" do
    users(:kumar).friends << users(:saswati)
    users(:kumar).friends.reload
    assert users(:kumar).friends.include?(users(:saswati))
  end
end
