FactoryGirl.define do
  factory :workout do
    exercise_id 4
    food_search "Pizza"
    calories "320"

    before :create do
      create :exercise
    end
  end
end
