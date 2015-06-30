class FoodSearchesController < ApplicationController
  respond_to :json

  def index
    respond_with Food.all(params[:food_search])
  end


end