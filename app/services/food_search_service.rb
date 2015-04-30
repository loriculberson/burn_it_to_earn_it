class FoodSearchService
  attr_reader :client

  def initialize
    config = YAML.load(ERB.new(File.read(Rails.root.join("config/fitgem.yml"))).result)
    @client = Fitgem::Client.new(config[:oauth])
  end

  def search_foods(food)
    client.find_food("#{food}")
  end

end