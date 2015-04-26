require 'rails_helper'

RSpec.describe "first time user", type: :feature do
  before(:each) do
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  it "can see the health profile page after successful twitter login" do 
    visit '/'
    mock_omniauth_user
    click_on "Sign in with twitter"
    expect(page).to have_content("Health Profile")
  end

  it "fills in health profile info" do
    visit '/'
    mock_omniauth_user
    click_on "Sign in with twitter"
    choose 'Female'
    fill_in 'user[first_name]', with: 'Wendy'
    fill_in 'user[last_name]', with: 'Smith'
    fill_in 'user[email]', with: 'wendy@example.com'
    fill_in 'user[age]', with: '25'
    fill_in 'user[weight]', with: '150'
    choose 'Crazy Fit'
    click_button "Submit"

    expect(page).to have_content("Female")
    expect(page).to have_content("Wendy Smith")
    expect(page).to have_content("wendy@example.com")
    expect(page).to have_content("25")
    expect(page).to have_content("150")
    expect(page).to have_content("Crazy Fit")
  end
end
