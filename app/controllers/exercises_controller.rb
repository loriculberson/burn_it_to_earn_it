class ExercisesController < ApplicationController

  def index
    @body_class="exercise-pg-image"
    if current_user.nil?
       @exercises = Exercise.order("RANDOM()").limit(5)
    else
      @exercises = Exercise.all
    end
  end
end


@exercises = 