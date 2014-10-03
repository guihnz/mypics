class PagesController < ApplicationController

  def home
  	redirect_to profile_path(current_user.id) if user_signed_in?
  end

  def about
  end
end
