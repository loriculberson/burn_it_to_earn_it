require 'rails_helper'

RSpec.describe "unregistered users can select exercises", type: :feature do

  def unregistered_user_lands_on_exercises_page
    visit '/'
    fill_in('search for food', with: 'burger')
    fill_in('enter weight', with: '150')
    save_and_open_page
    click_on 'EARN IT NOW!'
  end

  it "can select exercise checkboxes", vcr: true do
    unregistered_user_lands_on_exercises_page
    check('checkbox')
    click_on 'Save it!'
    expect(page).to have_content("Authorize burn it to earn it to use your account?")
    end
  end
end
