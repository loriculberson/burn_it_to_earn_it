require 'rails_helper'

RSpec.describe "first time user", type: :feature do
  before(:each) do
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  def log_in_with_twitter
    visit '/'
    mock_omniauth_user
    click_on "Sign in with twitter"
  end

  def update_general_user_info
    fill_in 'user[first_name]', with: 'Wendy'
    fill_in 'user[last_name]', with: 'Smith'
    fill_in 'user[email]', with: 'wendy@example.com'
    click_button "Submit"
  end

  it "can see the health profile page after successful twitter login" do 
    log_in_with_twitter
    expect(current_path).to eq(edit_user_path)
  end

  it "fills in general user profile info" do
    log_in_with_twitter
    update_general_user_info

    expect(page).to have_content("Health Profile")
  end

  it "fills in health information" do
    log_in_with_twitter
    update_general_user_info

    choose 'Female'
    fill_in 'user[age]', with: '25'
    fill_in 'user[weight]', with: '150'
    choose 'Diesel Fit'
    click_button "Submit"

    expect(page).to have_content("Wendy")
    expect(page).to have_content("25")
    expect(page).to have_content("150")
    expect(page).to have_content("Diesel Fit")

  end
end
