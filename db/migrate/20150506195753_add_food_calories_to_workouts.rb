class AddFoodCaloriesToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :calories, :integer
    add_column :workouts, :food_search, :string
  end
end
