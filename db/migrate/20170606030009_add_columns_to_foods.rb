class AddColumnsToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :usda_id, :string
    add_column :foods, :serving_amount, :decimal
    add_column :foods, :serving_unit, :string
  end
end
