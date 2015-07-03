class PendingWorkout
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_workout(exercise_id, calories, food_search)
    contents["workout"] = { "exercise_id" => exercise_id, 
                            "calories"    => calories, 
                            "food_search" => food_search 
                          }
  end

end