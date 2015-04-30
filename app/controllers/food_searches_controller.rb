class FoodSearchesController < ApplicationController

  def index
    # @foods = Food.all
    @foods = Food.all(params[:food_search])
  end

  # def show
  #   @foods = Food.all(params[:food_search])
  #   # @foods = Food.formatted_search_list(food_name)
  # end

end