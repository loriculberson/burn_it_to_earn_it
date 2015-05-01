class FoodSearchesController < ApplicationController
  respond_to :json

  def index
    respond_with Food.all(params[:food_search])
    # @foods = Food.all(params[:food_search])
  end

  # def show
  #   @foods = Food.all(params[:food_search])
  #   # @foods = Food.formatted_search_list(food_name)
  # end

end