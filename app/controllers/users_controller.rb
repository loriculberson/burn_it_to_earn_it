class UsersController < ApplicationController
    def new
    end

    def create
      redirect_to new_health_profile_path
    end
end