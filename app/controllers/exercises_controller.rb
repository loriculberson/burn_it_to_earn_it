class ExercisesController < ApplicationController

  def index
    @body_class="exercise-pg-image"
    @food_search, @calories = params[:food_search].first.match(/(.+) \|.+\: (.+)/).captures
    @calories = @calories.to_i
    @weight = params[:weight].to_i

    if current_user.nil?
      @exercises = Exercise.some
    else current_user
      @exercises = Exercise.all
    end
  end

    def create
      
    end
end

