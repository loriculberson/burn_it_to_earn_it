require 'rails_helper'

RSpec.describe "unregistered users can select exercises", type: :feature do

  def unregistered_user_lands_on_exercises_page
    visit '/'
    fill_in('search for food', with: 'burger')
    fill_in('Weight', with: '150')
    click_on 'EARN IT NOW!'
  end

  it "can select exercise checkboxes" do
    unregistered_user_lands_on_exercises_page
    within(:css, ".exercise-check") do
      check('checkbox')
    end


  end
end