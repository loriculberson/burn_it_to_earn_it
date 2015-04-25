class UsersController < ApplicationController
  before do 
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
  end

  def new
  end

  def create
    redirect_to new_health_profile_path
  end

  def show
    
  end

  def update
  end
end