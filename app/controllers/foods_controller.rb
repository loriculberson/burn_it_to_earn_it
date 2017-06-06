class FoodsController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        foods = Food.search_by_name(params[:food_search]).map do |food|
          {
            name: food.name,
            calories: food.calories 
          }
        end
        render json: foods
      end
    end
  end
end