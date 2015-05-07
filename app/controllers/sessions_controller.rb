class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    
    if user.first_time?
      redirect_to edit_user_path(user)
      flash[:success] = "Welcome #{current_user.nickname}! Please fill out this information."
    else  
      redirect_to user_path(current_user)
      flash[:success] = "Welcome back!"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:danger] = "Successfully logged out!"
  end
end
