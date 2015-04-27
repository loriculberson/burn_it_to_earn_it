require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:exercise) { FactoryGirl.create(:exercise) }

  it "is valid when all parameters are given"  do
    expect(exercise).to be_valid
  end

  it "is not valid when name is nil"  do
    exercise.name = nil
    expect(exercise).not_to be_valid
  end

  it "is not valid when mets is nil"  do
    exercise.mets = nil
    expect(exercise).not_to be_valid
  end

  it "is not valid with duplicate name and mets" do
    exercise
    exercise2 = Exercise.new(name: "Running 10 mi/hr", mets: 16.0)
    expect(exercise2).not_to be_valid 
  end
end
