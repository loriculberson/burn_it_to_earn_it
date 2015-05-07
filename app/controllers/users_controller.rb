class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts
  end

  def update
  end
end


