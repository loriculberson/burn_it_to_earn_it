class HealthProfilesController < ApplicationController

  def edit
  end
  
  def index
    @body_class="registration-image"
  end

  def update
    if current_user.update_attributes(user_health_params)
      redirect_to user_path(current_user), notice: "Profile Complete! Let's Eat!"
    end
  end
end

# def update
#     @user = User.find(params[:id])
#     if @user.update_attributes(edited_user_params)
#       redirect_to root_path, notice: "You have succesfully updated your profile."
#     elsif @user.update_attributes(update_user_params)
#       redirect_to root_path, notice: "You have updated your origin city."
#     else
#       flash.now[:error] = @user.errors.full_messages
#       render :edit
#     end
#   end

  private

  def user_health_params
    params.require(:user).permit(:gender, :first_name, :last_name, :email, :age, 
          :weight, :fitness_level)
  end