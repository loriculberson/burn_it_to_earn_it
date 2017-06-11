require "rails_helper"

RSpec.describe "user interface with homepage", type: :feature do 

  it "can see a food search dropdown on the root path" do 
    visit '/'

    expect(page).to have_content("Burn it to Earn It")
    expect(page).to have_content("Burn it to Earn It")
  end

  def unregistered_user_lands_on_exercises_page
    Food.create(
      name: "McDONALD'S, hamburger",
      calories: 250,
      usda_id: "01"
    )

    visit '/'
    fill_in('search for food', with: 'mcdonald')
    click_on("McDONALD'S, hamburger | Calories: 250")

    fill_in('enter weight', with: '150')
    click_on 'EARN IT NOW!'
  end

  it "user searches for a food, enters weight", js: true do
    unregistered_user_lands_on_exercises_page

    expect(page).to have_content("McDONALD'S, hamburger")
    expect(page).to have_content("That's only 250 calories!")

  end

end