require "rails_helper"

RSpec.describe "user interface with homepage", type: :feature do 
  it "can see a food search dropdown on the root path" do 
    visit '/'
    expect(page).to have_content("Burn It to Earn It!")
  end
end