class ExercisesController < ApplicationController

  def index
    @body_class="exercise-pg-image"
    if current_user.nil?
       @exercises = Exercise.order("RANDOM()").limit(5)
    else current_user
      @exercises = Exercise.all
      # @exercises = current_user.favorite_exercises
    # else
    end

  end
    def create
      if current_user.nil?
        redirect_to exercises_path
      end
    end
end


