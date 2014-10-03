class UsersController < ApplicationController

	before_action :authenticate_user!, except: :public_profile

	def show
  	@user = User.find(params[:id])
  	@pics = current_user.pics
  end

end