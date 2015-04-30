class FoodSearchesController < ApplicationController

  def show
    # @foods = Food.formatted_search_list(food_name)
    @foods = Food.all(params[:food_search])
  end

end