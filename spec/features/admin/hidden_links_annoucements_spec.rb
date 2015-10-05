require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:announcement) { FactoryGirl.create(:announcement, creator: user) }

  context "anonymous users" do
    scenario "cannot see the New Announcement link" do
      visit "/announcements"
      expect(page).not_to have_link "New Announcement"
    end

    scenario "cannot see the Delete Announcement link" do
      visit announcement_path(announcement)
      expect(page).not_to have_link "Delete Announcement"
    end
  end

  context "reqular users" do   
    before { login_as(user) }

    scenario "cannot see the New Announcement link" do
      visit "/announcements"
      expect(page).not_to have_link "New Announcement"
    end

    scenario "cannot see the Delete Announcement link" do
      visit announcement_path(announcement)
      expect(page).not_to have_link "Delete Announcement"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Announcement link" do
      visit "/announcements"
      expect(page).to have_link "New Announcement"
    end

    scenario "can see the Delete Announcement link" do
      visit announcement_path(announcement)
      expect(page).to have_link "Delete Announcement"
    end
  end
end