require 'rails_helper'

RSpec.describe "see exercise table", type: :feature do 
  it "can see a list of exercises" do 
    visit '/'
    click_on "EARN IT NOW!"
    
    expect(page).to have_content("If You Eat")
  end

end