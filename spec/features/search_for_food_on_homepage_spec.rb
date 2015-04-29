require "rails_helper"

RSpec.describe "user interface with homepage", type: :feature do 
  it "can see a food search dropdown on the root path" do 
    visit '/'
    expect(page).to have_content("Burn It to Earn It!")
  end

  it "user searches for a food enter weight "  do
    visit '/'
    fill_in('Search', with: 'burger')
    fill_in('Weight', with: '150')
    click_on 'Earn it!"'
    expect(page).to have_content('burger')
    
  end
end