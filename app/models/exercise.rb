class Exercise < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :mets, presence: true
  has_many :workouts

  def burn_time(calories, weight) #model gets cal and weight from the view
    burn_time_calculator = BurnTimeCalculator.new(calories, weight, mets)
    burn_time_calculator.burn_time
  end

  def self.some
    where(name:["Walk - moderate", "Run - 10 min/mi", 
                "Cycling - moderate",
                "Swim - easy", "Standing"])
  end
end
