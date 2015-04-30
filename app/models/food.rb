class Food < OpenStruct
  def self.service
    @service ||= FoodSearchService.new
  end

  def self.all(food_name)
    service.search_foods(food_name).values[0].map do |food|
      Food.new(food)
    end
  end
end
