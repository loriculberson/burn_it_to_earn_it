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
      require 'pry';binding.pry
    client = Fitgem::Client.new(config[:oauth])
    response = client.find_food(params[:search])
       
    end
end


