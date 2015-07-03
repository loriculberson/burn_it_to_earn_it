class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    if @pending_workout.contents.empty?
      redirect_to user_path
    else
      Workout.create( user_id: current_user.id, exercise_id: @pending_workout.contents["workout"]["exercise_id"].to_i, 
                      calories: @pending_workout.contents["workout"]["calories"].to_i, 
                      food_search: @pending_workout.contents["workout"]["food_search"]
                    )
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
