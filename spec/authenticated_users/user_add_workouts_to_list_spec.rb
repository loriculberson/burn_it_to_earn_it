require "rails_helper"

RSpec.describe "authenticated user adds workouts", type: :feature do
  before(:each) do
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  def log_in_with_twitter
    visit '/'
    mock_omniauth_user
    click_on "Sign in with twitter"
  end

xit "can add exercises to the user workouts page" do
    log_in_with_twitter
    visit exercises_path

    expect(page).to have_content(@exercise.name)
  end
end

