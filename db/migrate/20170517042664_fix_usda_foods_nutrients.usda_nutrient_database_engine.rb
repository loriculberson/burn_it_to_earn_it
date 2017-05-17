# This migration comes from usda_nutrient_database_engine (originally 12)
class FixUsdaFoodsNutrients < ActiveRecord::Migration
  def change
    remove_column :usda_foods_nutrients, :id

    change_table :usda_foods_nutrients do |t|
      t.remove_index name: "foods_nutrients_index"
    end
  end
end
