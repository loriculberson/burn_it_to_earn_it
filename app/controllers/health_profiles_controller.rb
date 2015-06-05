class HealthProfilesController < ApplicationController

  def edit
  end
  
  def index
    @body_class="registration-image"
  end

  def update
    if current_user.update_attributes(user_health_params) && current_user.missing_weight?
      redirect_to edit_health_profile_path
    else
      redirect_to user_path
      flash[:notice] = "Profile Complete!"
    end
  end

  private

  def user_health_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :age, 
          :weight, :fitness_level)
  end
end