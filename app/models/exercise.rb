class Exercise < ActiveRecord::Base
  validates :name, :mets, presence: true, uniqueness: true

 
  #format burn_time into hours and minutes
  def burn_time
    if hours == "0" 
      minutes.to_i.to_s + " min"
    else
      hours + " hours and " + minutes.to_i.to_s + " min"
    end
  end

  def hours
    burn_time_by_exercise.to_s.split(".")[0]
  end

  def minutes
    (("." + burn_time_by_exercise.to_s.split(".")[1]).to_f * 60).round(2)
  end

   def burn_time_by_exercise
    if @current_user.nil?
      (10.26/mets).round(2)
    end
  # else
    # (food.calories * 2.2)/
    # current_user.weight * exercise.mets
  end


end
