class AddMetToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :mets, :decimal, :default => 1
  end
end
