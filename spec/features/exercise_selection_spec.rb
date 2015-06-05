require 'rails_helper'

RSpec.describe "unregistered users can select exercises", type: :feature do

  def unregistered_user_lands_on_exercises_page
    visit '/'
    fill_in('search for food', with: 'mang')
    fill_in('search for food', with: '')

    page.execute_script("$('##{scrollable-dropdown-menu}').trigger('focus');")
    page.execute_script ("$('##{scrollable-dropdown-menu}').trigger('keydown');")
    selector = "#tt-dropdown-menu:contains('#{options[:select]}')"

    # within('#scrollable-dropdown-menu') do
    #   click_on('Mango, Raw | Calories: 134')
    # end

    fill_in('enter weight', with: '150')
    click_on 'EARN IT NOW!'
  end

  it "can select exercise checkboxes", vcr: true do
    unregistered_user_lands_on_exercises_page
    choose('A Radio Button')
    click_on 'Save it!'
    expect(page).to have_content("Mango, Raw sounds delicious!")
    end
end

