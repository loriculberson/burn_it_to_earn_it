class SessionsController < ApplicationController

  def new
  end

  def create
    user  = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome!"
      redirect_to root_path
      
      # redirect_to user_path(user)
    else
      flash[:danger] = 'Invalid login.'
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:notice] = "Successfully logged out!"
  end

  
end