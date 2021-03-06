class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_profile_name(params[:id])

  	if @user
  		@markers = @user.markers.all
  		render actions: :show
  		@friends = @user.user_friendships.all
  	else
	  	render file: 'public/404', status: 404, formats: [:html]
	end
  end
end
