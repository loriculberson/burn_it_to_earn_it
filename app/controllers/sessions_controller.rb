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


    # if don't have workout_page_data
    #   redirect to the exercises path

    # if I do have workout_page_data create the workout
    # user.create_workout(session[:workout_page_data])

    # when they come back create the workout

    # app/models/user.rb
    # class User < ...
    #   def create_workout(workout_data) 
    #     require 'pry'
    #     binding.pry
    #   end
    # end

    # session[:workout_page_data]
    # .each do |exercise_id|
    #   Workout.create!(user_id: user.id, exercise_id: exercise_id, 
    #                   calories: calories, food_search: food_search,
    #                   weight: weight)
    # end