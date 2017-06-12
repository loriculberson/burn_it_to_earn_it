desc "Upsert foods from USDA database"
task upsert_foods: :environment do
  bar = RakeProgressbar.new(UsdaNutrientDatabase::Food.count)

  UsdaNutrientDatabase::Food.all.each do |usda_food|
    bar.inc

    food = Food.find_or_initialize_by(usda_id: usda_food.nutrient_databank_number)
    
    if !usda_food.weights.empty?
      food.name = usda_food.long_description 
      single_serving = usda_food.weights.min_by(&:gram_weight)
      multiplier = single_serving.gram_weight / 100
      calories_per_hundred_grams = 
        usda_food.foods_nutrients.find_by(nutrient_number: "208").nutrient_value
      food.calories = calories_per_hundred_grams * multiplier
      food.serving_amount = single_serving.amount
      food.serving_unit = single_serving.measurement_description

      food.save!
      puts "Food: #{{food.name}} USDA ID: #{{food.usda_id}}"
    end
  end
  bar.finished
end

