class AddCompleteToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :complete, :boolean, :default => false
  end
end
