class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  def friend_requested(user_friendship_id)
  	user_friendship = UserFriendhip.find(user_friendship_id)

  	@user = user_friendship.user
  	@friend = user_friendship.friend

  	mail to: @friend.email,
  		subject: "#{@user.first_name} wants to be friends with you."
  end

  def friend_request_accepted(user_friendship_id)
  	user_friendship = UserFriendhip.find(user_friendship_id)

  	@user = user_friendship.user
  	@friend = user_friendship.friend

  	mail to: @user.email,
  		subject: "#{@friend.first_name} accepted your friend request!"
  end

end
