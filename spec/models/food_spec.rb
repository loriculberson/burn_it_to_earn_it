require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:food) { FactoryGirl.create(:food) }

  it "is valid when all parameters are given"  do
    expect(food).to be_valid
  end

  it "is not valid when name is nil"  do
    food.name = nil
    expect(food).not_to be_valid
  end

  it "is not valid when calories is nil"  do
    food.calories = nil
    expect(food).not_to be_valid
  end

end
