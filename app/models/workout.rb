class Workout < ActiveRecord::Base
  validates :exercise_id, presence: true
  validates :calories, presence: true
  validates :food_search, presence: true

  belongs_to :user
  belongs_to :exercise


  def burn_time
    exercise.burn_time(calories, user.weight) 
  end
end
