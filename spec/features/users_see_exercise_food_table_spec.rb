require 'rails_helper'

RSpec.describe "users see sample food and exercise table", type: :feature do 

  it "can see the food name that the user selected", js: true do
    visit exercises_path(food_search: { name: "Sour Brite Crawlers" , 
                         brand: "Trolli", calories: "210"})
    expect(page).to have_content("Sour Brite Crawlers")
  end

  it "can see the selected food's calories" do
    visit exercises_path(food_search: { name: " Sour Brite Crawlers" , 
                         brand: "Trolli", calories: "210"})
    expect(page).to have_content("210 calories")
  end

  it "can see the users weight" do
    visit exercises_path(weight: "150", food_search: { name: " Sour Brite Crawlers" , 
                         brand: "Trolli", calories: "210"})
    expect(page).to have_content("150 pounds")
  end

  it "sees amount of time to complete exercises" do     
    exercise = FactoryGirl.create(:exercise, name: "Walk - moderate", mets: 3.5 )
    exercise = FactoryGirl.create(:exercise, name: "Cycling - moderate", mets: 10 )
    visit exercises_path(weight: "150", food_search: { name: "Sour Brite Crawlers" , 
                         brand: "Trolli", calories: "400"})   
    within('.table') do
      expect(page).to have_content("Walk - moderate")
      expect(page).to have_content("1 hour and 40 min")
      expect(page).to have_content("Cycling - moderate")
      expect(page).to have_content("35 min")
    end
  end


end

 

