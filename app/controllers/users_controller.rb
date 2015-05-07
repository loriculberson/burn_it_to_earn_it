class UsersController < ApplicationController
  def new
  end

  def create
    workout_page_data = {
      food_search:  params[:food_search], 
      exercise_id: params[:exercise_id],
      calories:     params[:calories]
    }
    if current_user.nil?
      session[:workout_page_data] = workout_page_data
      redirect_to '/auth/twitter'
    else
      current_user.create_workout(workout_page_data)
      redirect_to user_path
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts
  end

  def update
  end
end


