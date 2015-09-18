require "rails_helper"

RSpec.feature "Users can view a announcement" do
  scenario "with the announcement details" do
    announcement = FactoryGirl.create(:announcement, title: "Code & Coffee")

    visit "/announcements"
    click_link "Code & Coffee"
    expect(page.current_url).to eq announcement_url(announcement)
  end
end