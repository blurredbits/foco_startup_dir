require "rails_helper"

RSpec.feature "Users can delete companies" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
  end

  let(:creator) { FactoryGirl.create(:user) }

  scenario "successfully" do
    FactoryGirl.create(:announcement, creator: creator, title: "Code & Coffee")

    visit "/announcements"
    click_link "Code & Coffee"
    click_link "Delete Announcement"

    expect(page).to have_content "Announcement has been deleted."
    expect(page.current_url).to eq announcements_url
    expect(page).to have_no_content "Code & Coffee"
  end
end