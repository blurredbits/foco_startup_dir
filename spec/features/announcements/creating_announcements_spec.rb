require "rails_helper"

RSpec.feature "User can create announcements" do
  before do
    visit "/announcements"
    click_link "New Announcement"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Code & Coffee"
    fill_in "Description", with: "Every Tuesday morning from 9:30 - 11:30am."

    click_button "Create Announcement"

    expect(page).to have_content "Announcement has been created."
  end

  scenario "with invalid attributes" do
    # fill_in "Title", with: ""
    # click_button "Create Announcement"

    # expect(page).to have_content "Announcement has not been created."
  end
end