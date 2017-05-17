require "rails_helper"

RSpec.describe FoodSearchService do 

  describe '#search_foods' do 
    it "returns a list of search results" do 
      food = "burger"
      list = "burger, McDouble"

      food_search_service = FoodSearchService.new

      food_list = food_search_service.search_foods(food)
      require 'pry';binding.pry
      expect(food_search_service.search_foods(food)).to eq(list)
    end
  end
end