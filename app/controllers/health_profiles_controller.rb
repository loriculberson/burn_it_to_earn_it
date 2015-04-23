class HealthProfilesController < ApplicationController

  def new
  end
  
  def index
    @body_class="registration-image"
  end

  def create
    redirect_to root_path
  end
end
