require "rails_helper"

RSpec.feature "Users can view a announcement" do
  
  let(:creator) { FactoryGirl.create(:user) }

  scenario "with the announcement details" do
    announcement = FactoryGirl.create(:announcement, creator: creator, title: "Code & Coffee")

    visit "/announcements"
    click_link "Code & Coffee"
    expect(page.current_url).to eq announcement_url(announcement)
  end
end