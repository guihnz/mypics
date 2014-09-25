class PagesController < ApplicationController

  def home
  	redirect_to pics_path if user_signed_in?
  end

  def about
  end
end
