class ExercisesController < ApplicationController

  def index
      @workout = Workout.new
      @food_search, @calories = params[:food_search].first.match(/(.+) \|.+\: (.+)/).captures
      @calories = @calories.to_i

      if current_user
        @weight = current_user.weight
      else
        @weight = params[:weight].to_i
      end

    if current_user.nil?
      @exercises = Exercise.some
    else
      @exercises = Exercise.all
    end
  end

end

