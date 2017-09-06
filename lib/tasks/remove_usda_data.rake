desc "Delete db content"
task remove_usda_data: :environment do 
  verbose false
  record_removal_counter = 0
  puts "FoodsNutrient count: #{UsdaNutrientDatabase::FoodsNutrient.count}"
  record_removal_counter+= UsdaNutrientDatabase::FoodsNutrient.count
  UsdaNutrientDatabase::FoodsNutrient.delete_all
  puts "After FoodsNutrient count: #{UsdaNutrientDatabase::FoodsNutrient.count}"
 
  puts "SourceCode count: #{UsdaNutrientDatabase::SourceCode.count}"
  record_removal_counter+= UsdaNutrientDatabase::SourceCode.count
  UsdaNutrientDatabase::SourceCode.delete_all
  puts "SourceCode count: #{UsdaNutrientDatabase::SourceCode.count}"
  
  puts "Weight count: #{UsdaNutrientDatabase::Weight.count}"
  record_removal_counter+= UsdaNutrientDatabase::Weight.count
  UsdaNutrientDatabase::Weight.delete_all
  puts "After Weight count: #{UsdaNutrientDatabase::Weight.count}"
  
  puts "Footnote count: #{UsdaNutrientDatabase::Footnote.count}"
  record_removal_counter+= UsdaNutrientDatabase::Footnote.count
  UsdaNutrientDatabase::Footnote.delete_all
  puts "After Footnote count: #{UsdaNutrientDatabase::Footnote.count}"
  
  puts "Food count: #{UsdaNutrientDatabase::Food.count}"
  record_removal_counter+= UsdaNutrientDatabase::Food.count
  UsdaNutrientDatabase::Food.delete_all
  puts "After Food count: #{UsdaNutrientDatabase::Food.count}"
  
  puts "FoodGroup count: #{UsdaNutrientDatabase::FoodGroup.count}"
  record_removal_counter+= UsdaNutrientDatabase::FoodGroup.count
  UsdaNutrientDatabase::FoodGroup.delete_all
  puts "After FoodGroup count: #{UsdaNutrientDatabase::FoodGroup.count}"
  
  
  puts "Nutrient count: #{UsdaNutrientDatabase::Nutrient.count}"
  record_removal_counter+= UsdaNutrientDatabase::Nutrient.count
  UsdaNutrientDatabase::Nutrient.delete_all
  puts "After Nutrient count: #{UsdaNutrientDatabase::Nutrient.count}"
  
  
  puts "Total records deleted: #{record_removal_counter}"
end
