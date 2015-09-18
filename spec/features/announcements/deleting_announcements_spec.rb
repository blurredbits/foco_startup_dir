require "rails_helper"

RSpec.feature "Users can delete companies" do
  scenario "successfully" do
    FactoryGirl.create(:announcement, title: "Code & Coffee")

    visit "/announcements"
    click_link "Code & Coffee"
    click_link "Delete Announcement"

    expect(page).to have_content "Announcement has been deleted."
    expect(page.current_url).to eq announcements_url
    expect(page).to have_no_content "Code & Coffee"
  end
end