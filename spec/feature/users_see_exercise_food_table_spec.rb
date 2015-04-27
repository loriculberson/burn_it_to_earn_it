require 'rails_helper'

RSpec.describe "users see sample food and exercise table", type: :feature do 
  it "can see a list of exercises" do 
    visit '/'
    click_on "EARN IT NOW!"
    
    expect(page).to have_content("If You Eat")
  end

  it "can select a food and time to burn column populates" do    
    visit exercises_path
    within('table') do 
      expect(page).to have_content("Time to Burn it Off")
    end
  end
end

 

