class ExercisesController < ApplicationController

  def index
    @body_class="exercise-pg-image"
    @exercises = Exercise.all
  end
end
