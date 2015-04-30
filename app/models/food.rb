class Food < ActiveRecord::Base
  validates :name, :calories, presence: true, uniqueness: true

  def self.service
    @service ||= FoodSearchService.new
  end

  def self.all(food_name)
    service.search_foods(food_name).values[0]
    # .map do |food|
          # food['name']
          # food['calories']
    # end
  end

  def parsed_foods
    parse.all(food_name)
  end

    def schools
    parse(connection.get("schools"))
  end
  
end
