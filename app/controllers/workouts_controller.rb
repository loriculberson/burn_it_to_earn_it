class WorkoutsController < ApplicationController

  def index
    @workouts = current_user.workouts
  end

  def create
    if current_user 
      Workout.create(workout_params.merge(user_id: current_user.id, exercise_id: params["exercise_id"]))
      redirect_to user_path
      flash[:notice] = "Workout saved!"
    else 
      flash[:notice] = "You must log in with Twitter! "
      redirect_to '/auth/twitter'
    end
  end

  private
  def workout_params
    params.require(:workout).permit(:exercise_id,
                    :calories, :food_search)
  end

end
