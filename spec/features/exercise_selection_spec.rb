require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe "unregistered users can select exercises", type: :feature do

  def unregistered_user_lands_on_exercises_page
    visit '/'
    fill_in('search for food', with: 'mango')
    click_on("Mango, Raw | Calories: 134")

    fill_in('enter weight', with: '150')
    click_on 'EARN IT NOW!'
  end

  it "can select exercise", js: true do
    unregistered_user_lands_on_exercises_page
    driver = Selenium::WebDriver.for :firefox
    driver.find_element(name: "[exercise_id]").click
    click_on 'Save it!'
    
    expect(page).to have_content("Authorize burn it to earn it to use your account?")
  end

end

#delete if exercise selection test passes in  