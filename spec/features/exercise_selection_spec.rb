require 'rails_helper'
require 'selenium-webdriver'

  def create_exercises
    Exercise.create(name: "Walk - easy", pace: "2 mi/hr", mets: 2.5 )
    @exercise2 = Exercise.create(name: "Run - 10 min/mi", pace: "6 mi/hr", mets: 10 )
    Exercise.create(name: "Run - 6 min/mi", pace: "10 mi/hr", mets: 16 )
  end

  def create_food
    Food.create(
      name: "Mangos",
      calories: 99,
      usda_id: "02"
    )
  end

  def user_searches_for_food
    create_food

    visit '/'

    fill_in('search for food', with: 'mango')
    click_on("Mangos | Calories: 99")

    fill_in('enter weight', with: '200')
    click_on 'EARN IT NOW!'
  end

  def user_selects_exercise
    choose("Run - 10 min/mi")
    click_on 'Save it!'
  end

  def update_general_user_info
    fill_in 'user[first_name]', with: 'Wendy'
    fill_in 'user[last_name]', with: 'Smith'
    fill_in 'user[email]', with: 'wendy@example.com'
    click_button "Submit"
  end

  def fill_in_health_info
    choose 'Female'
    fill_in 'user[age]', with: '25'
    fill_in 'user[weight]', with: '150'
    choose 'Diesel Fit'
    click_button "Submit"
  end

RSpec.describe "users can create a workout", js: true, type: :feature do
  context "first time user" do
  
  it "can add a workout to the pending session" do
    mock_omniauth_user
    create_exercises
    user_searches_for_food
    user_selects_exercise
    update_general_user_info
    fill_in_health_info

    expect(current_path).to eq(user_path)
    # expect(page).to have_content("Run - 10 min/mi")
    # expect(page).to have_content("Mango, raw")
  end
end

  context "user with an account" do

    def log_in_with_twitter
      visit '/'
      click_on "Sign in with twitter"
    end

    it "can add exercises to the user workouts page" do
      create_food
      mock_omniauth_user_authenticated
      create_exercises
      log_in_with_twitter
      fill_in('search for food', with: 'mango')
      click_on("Mangos | Calories: 99")
      click_on 'EARN IT NOW!'
      user_selects_exercise

      expect(page).to have_content(@exercise2.name)
    end
  end
end