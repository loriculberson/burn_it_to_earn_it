require "rails_helper"

RSpec.describe "user interface with homepage", type: :feature do 

  it "can see a food search dropdown on the root path" do 
    visit '/'

    expect(page).to have_content("Burn it to Earn It")
  end

  def unregistered_user_lands_on_exercises_page
    visit '/'
    fill_in('search for food', with: 'mcd')
    click_on("MCDONALD'S, Filet-O-Fish | 400 calories")

    fill_in('enter weight', with: '150')
    click_on 'EARN IT NOW!'
  end

  it "user searches for a food, enters weight", js: true do
    unregistered_user_lands_on_exercises_page

    expect(page).to have_content('My Scheduled Workouts')
    expect(page).to have_content("MCDONALD'S, Filet-O-Fish")

  end

end