class UsersController < ApplicationController
  def new
  end

  def show
    if current_user 
      @workouts = current_user.workouts.desc_sorted
    else
      redirect_to root_path
      flash[:notice] = "You are not logged in."
    end
  end

  def update
  end
end


