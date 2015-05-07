class BurnTimeCalculator
  attr_reader :calories, :weight, :mets

  def initialize(calories, weight, mets)

    @calories = calories
    @weight = weight
    @mets = mets
  end

  def burn_time
    if hours == "0" 
      minutes.to_i.to_s + " min"
    elsif hours == "1"
      hours + " hour and " + minutes.to_i.to_s + " min"
    else
      hours + " hours and " + minutes.to_i.to_s + " min"
    end
  end

  private
  # attr_reader :calories, :weight, :mets
  
  def hours
    burn_time_by_exercise.to_s.split(".")[0]
  end

  def minutes
    (("." + burn_time_by_exercise.to_s.split(".")[1]).to_f * 60).round(2)
  end

   def burn_time_by_exercise
    (calories * 2.2) / (weight * mets)
  end
end