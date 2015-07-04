class PendingWorkoutsController < ApplicationController

  def create
    exercise_id = params["workout"]["exercise_id"]
    calories    = params["workout"]["calories"]
    food_search = params["workout"]["food_search"]
    pending_workout.add_workout(exercise_id, calories, food_search)
    session[:pending_workout] = pending_workout.contents
    flash[:success] = "Login with Twitter to save your workout."
    redirect_to '/auth/twitter' 
  end
end
