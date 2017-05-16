class FoodSearchService

  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => "https://api.nal.usda.gov")
  end

  def search_foods(food)
    parse(connection.get(
      "/ndb/search/?format=json&q=#{food}&sort=n&max=25&offset=0&api_key=#{ENV['USDA_KEY']}" 
    )
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
