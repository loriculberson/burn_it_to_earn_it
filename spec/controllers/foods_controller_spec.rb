require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe "GET index"  do 
    it "returns foods by name" do 

      Food.create!(
        name: "McDonald's, hamburger", 
        calories: 250, 
        usda_id: "1",
        serving_amount: 0.5,
        serving_unit: "cups"
      )
      
      get :index, params: {food_search: "mcdonald"}, format: "json"

      food_list = [
        {"name" => "McDonald's, hamburger", "calories" => 250}
      ]

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq(food_list)
    end
  end
end
