require 'rails_helper'

RSpec.feature "User can edit existing announcements" do
  
  let(:creator) { FactoryGirl.create(:user) }

  before do
    FactoryGirl.create(:announcement, creator: creator, title: "Code & Coffee")

    visit "/announcements"
    click_link "Code & Coffee"
    click_link "Edit Announcement"
  end
  
  scenario "with valid attributes" do
    fill_in "Title", with: "Scout APM"
    click_button "Update Announcement"

    expect(page).to have_content "Announcement has been updated."
    expect(page).to have_content "Scout APM"
  end

  scenario "with invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Announcement"

    expect(page).to have_content "Announcement has not been updated."
  end

end