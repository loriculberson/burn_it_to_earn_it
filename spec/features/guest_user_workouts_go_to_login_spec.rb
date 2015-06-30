require 'rails_helper'

RSpec.describe "unregistered user", type: :feature do 

  # def log_in_with_twitter
  #   visit '/'
  #   mock_omniauth_user
  #   click_on "Sign in with twitter"
  # end

  xit "can select an exercise and the exercise persists until logged in" do
    visit exercises_path
    choose('Running 10 mi/hr')
    click_on 'Save it!'
    expect(page).to have_content("Pizza Zone")
  end
end