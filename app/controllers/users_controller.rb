class UsersController < ApplicationController
  def new
  end

  def show
    @workouts = current_user.workouts
  end

  def update
  end
end


