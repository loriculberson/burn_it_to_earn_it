require 'rails_helper'

RSpec.describe "user login", type: :feature do
  before(:each) do
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  def user_login
    visit '/'
    expect(page).not_to have_content("Welcome twitter_mock_user")
    mock_omniauth_user
    click_on "Sign in with twitter"
  end
    
  it "can be able to log in with twitter" do
    user_login

    expect(page).to have_content("Welcome twitter_mock_user")
  end

  it "can logout" do
    user_login
    click_on 'Logout'
    expect(page).to have_content("Successfully logged out!")
    expect(page).not_to have_content("Welcome twitter_mock_user")
  end
end


