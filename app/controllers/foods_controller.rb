class FoodsController < ApplicationController
  def index
    @foods = current_user.foods

  end

  # user searches for food
  def create
    #if food is in db pull data from there
    #if not, hit api and send data to food controller
    # food = get_food(params[:search])
    # weight = params[:weight]
    # redirect_to(controller: 'exercises', food: food, weight: weight)
  end

  def search
    #api data will come back
 
    #params
  end

end




#
#Foods controller 
# User searches for a food
# FoodsControlelr#search
# hit the fitbit api
# render a view with the response from api (list)
# user chooses a food 
# FoodsController#create (find or create in db)
