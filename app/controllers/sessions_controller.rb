class SessionsController < ApplicationController

  def new
  end

  def create
    redirect_to root_path
    flash[:notice] = "Signed in! Let's burn some calories!"
  end

end