class UsersController < ApplicationController
  def edit
    @body_class="registration-image"
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


