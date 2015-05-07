class WorkoutsController < ApplicationController

  def index
    @workouts = current_user.workouts
  end

  def create
    # workout = Workout.new(workout_params)
    if current_user 
      flash[:notice] = "Workout saved!"
      # current_user.workouts << workout
      Workout.create(workout_params.merge(user_id: current_user.id, exercise_id: params["exercise_id"]))
      redirect_to user_path(current_user)
    else 
      flash[:notice] = "You must log in with Twitter! "
      redirect_to '/auth/twitter'
      #store workout params in the session
    end
  end

  private
  def workout_params
    params.require(:workout).permit(:exercise_id,
                    :calories, :food_search)
  end

end
