require "rails_helper"

RSpec.describe BurnTimeCalculator do 

  describe '#burn_time' do
    it "displays time correctly if hours equal 0" do
      calories = 400
      weight = 150
      mets = 10

      burn_time_calculator = BurnTimeCalculator.new(calories, weight, mets)
      time = "35 min"

      expect(burn_time_calculator.burn_time).to eq(time)
    end

    it "displays time correctly if hours equal 0" do
      calories = 400
      weight = 150
      mets = 3.5

      burn_time_calculator = BurnTimeCalculator.new(calories, weight, mets)
      time = "1 hour and 40 min"

      expect(burn_time_calculator.burn_time).to eq(time)
    end

    it "displays time correctly if hours equal 0" do
      calories = 400
      weight = 150
      mets = 1.3

      burn_time_calculator = BurnTimeCalculator.new(calories, weight, mets)
      time = "4 hours and 30 min"

      expect(burn_time_calculator.burn_time).to eq(time)
    end
  end
end
