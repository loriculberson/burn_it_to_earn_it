class ExercisesController < ApplicationController

  def index
    @body_class="exercise-pg-image"
    @food_search = params[:food_search]
    @weight = params[:weight].to_i
    @calories = @food_search[:calories].to_i

    if current_user.nil?
      @exercises = Exercise.some
    else current_user
      @exercises = Exercise.all
      # @exercises = current_user.favorite_exercises
    # else
    end
  end

    def create
      

    end
end

