require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe "first time user can search for food, select an exercise, and create a workout", js: true, type: :feature do
  
  before :each do
    mock_omniauth_user
  end

  def create_exercises
    Exercise.create!(name: "Walk - easy", pace: "2 mi/hr", mets: 2.5 )
    Exercise.create!(name: "Run - 10 min/mi", pace: "6 mi/hr", mets: 10 )
    Exercise.create!(name: "Run - 6 min/mi", pace: "10 mi/hr", mets: 16 )
  end

  def user_searches_for_food
    visit '/'

    fill_in('search for food', with: 'mango')
    click_on("Mango, Raw | Calories: 134")

    fill_in('enter weight', with: '200')
    click_on 'EARN IT NOW!'
  end

  def user_selects_exercise
    choose("Run - 10 min/mi")
    click_on 'Save it!'
  end

  it "can select exercise" do
    create_exercises
    user_searches_for_food
    user_selects_exercise

    expect(current_path).to eq(edit_user_path)
  end
end

