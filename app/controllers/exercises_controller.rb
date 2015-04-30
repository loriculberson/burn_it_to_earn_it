# require ‘nutritionix/api_1_1’
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

    #   require 'pry';binding.pry
    # provider = Nutritionix::Api_1_1.new(app_id, app_key)
    # # response = client.find_food(params[:search])

    #    client = Fitgem::Client.new(config[:oauth])
    # response = client.find_food(params[:search])

      

    end
end

# require_relative ‘../lib/nutritionix/api_1_1’

# def nxql_search_params
# fields = %w(brand_id brand_name item_id item_name nf_serving_size_qty nf_serving_size_unit)
# fields << %w(nf_calories nf_total_carbohydrate nf_sodium nf_dietary_fiber nf_protein)
# default_fields = fields.flatten

# { offset: 0, limit: 50, fields: default_fields }
# end

# app_id = ‘<YOUR_APP_ID>’
# app_key = ‘<YOUR_APP_KEY>’
# provider = Nutritionix::Api_1_1.new(app_id, app_key)
# search_params = nxql_search_params
# search_params.merge!(query: ‘potato’)
# results_json = provider.nxql_search(search_params)
# puts “Results: #{results_json}”

