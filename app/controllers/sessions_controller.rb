class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id

    if !user
      flash[:error] = "sorry there was an errore with twitter"
      redirect_to root_path and return
    end

    if pending_workout.contents.present?
      user.workouts.create(pending_workout.contents["workout"])
      session[:pending_workout].clear
    end

    if user.first_time? 
      redirect_to edit_user_path
      flash[:success] = "Welcome #{current_user.nickname}! Please fill out this information."
    else
      redirect_to user_path
      flash[:success] = "Welcome back!"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:danger] = "Successfully logged out!"
  end
end
