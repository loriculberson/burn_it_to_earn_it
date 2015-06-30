class WorkoutsController < ApplicationController

  def index
    #check to see if this is getting hit. These are workout choices
    @workouts = current_user.workouts
  end

  def create
    if current_user 
      workout = Workout.create(workout_params.merge(user_id: current_user.id, exercise_id: params["workout"]["exercise_id"]))
      
      workout.save!
      
      redirect_to user_path
      flash[:notice] = "Workout saved!"
    else 
      redirect_to '/auth/twitter'
    end
  end

  private
  def workout_params
    params.require(:workout).permit(:exercise_id,
                    :calories, :food_search)
  end
end
