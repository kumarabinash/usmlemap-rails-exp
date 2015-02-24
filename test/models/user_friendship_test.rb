require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:user)

  should belong_to(:friend)

  test "that creating a friendhisp workds " do
  	assert_nothing_raised do
	  	UserFriendship.create user: users(:kumar), friend: users(:saswati)
	end
  end

  test "that creating a friendship based on user id and ufriend id words" do 
  	UserFriendship.create user_id: users(:kumar).id, friend_id: users(:saswati).id
  	assert users(:kumar).friends.include?(users(:saswati))
  end
end
