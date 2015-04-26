class SessionsController < ApplicationController

  def new
  end

  def create
    user  = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    if user.first_time?
      redirect_to edit_health_profile_path
    else user 
      redirect_to user_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:notice] = "Successfully logged out!"
  end

  
end