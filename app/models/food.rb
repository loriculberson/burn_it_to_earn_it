class Food < ActiveRecord::Base
  validates :name, :calories, presence: true, uniqueness: true
  attr_reader :food_name

  def self.service
    @service ||= FoodSearchService.new
  end

  def self.all(food_name)
    service.search_foods(food_name).values[0]
  end


  
end
