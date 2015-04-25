require 'rails_helper'
OmniAuth.config.test_mode = true

RSpec.describe "user login", type: :feature do
  before(:each) do
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  def mock_omniauth_user
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545',
      :nickname => 'twitter_mock_user',
      :image_url => "mock_user_thumbnail_url",
      :token => "222333444"
    })
  end

  it "sees the homepage" do
    visit '/'
    expect(page).to have_content("Burn it")
  end

  it 'twitter is AuthHash' do
    mock_omniauth_user
    OmniAuth.configure do |config|
      expect(config.mock_auth[:twitter]).to be_kind_of(OmniAuth::AuthHash)
    end
  end
  
  it 'sets twitter attributes' do
    mock_omniauth_user
    OmniAuth.configure do |config|
      expect(config.mock_auth[:twitter].uid).to eq('123545')
      expect(config.mock_auth[:twitter].nickname).to eq('twitter_mock_user')
      expect(config.mock_auth[:twitter].image_url).to eq('mock_user_thumbnail_url')
      expect(config.mock_auth[:twitter].token).to eq('222333444')
    end
  end
  
  xit "can be able to log in with twitter" do
    visit '/'
    expect(page).not_to have_content("Welcome twitter_mock_user")
    click_on "Sign in with twitter"
    mock_omniauth_user
      save_and_open_page
    within(:css,'li .twitter-name-correction') do
      expect(page).to have_content("Welcome #{current_user.nickname}")
    end
  end

end


