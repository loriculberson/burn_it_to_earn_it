require 'rails_helper'

RSpec.describe "user login", type: :feature do
  before(:each) do
    OmniAuth.config.mock_auth[:twitter] = nil
  end
    
  it "can be able to log in with twitter" do
    visit '/'
    expect(page).not_to have_content("Welcome twitter_mock_user")
    mock_omniauth_user
    click_on "Sign in with twitter"
    # save_and_open_page
    # within('li.twitter-name-correction') do
      expect(page).to have_content("Welcome twitter_mock_user")
    # end
  end
end


