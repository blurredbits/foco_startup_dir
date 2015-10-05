require "rails_helper"

RSpec.feature "Users can only see appropriate links" do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:office) { FactoryGirl.create(:office, creator: user) }

  context "anonymous users" do
    scenario "cannot see the New Office link" do
      visit "/offices"
      expect(page).not_to have_link "New Office"
    end

    scenario "cannot see the Delete Office link" do
      visit office_path(office)
      expect(page).not_to have_link "Delete Office"
    end
  end

  context "regular users" do

    before { login_as(user) }

    scenario "cannot see the New Office link" do
      visit "/offices"
      expect(page).not_to have_link "New Office"
    end

    scenario "cannot see the Delete Office link" do
      visit office_path(office)
      expect(page).not_to have_link "Delete Office"
    end
  end

  context "admin users" do
    
    before { login_as(admin) }

    scenario "can see the New Office link" do
      visit "/offices"
      expect(page).to have_link "New Office" 
    end

    scenario "can see the Delete Office link" do
      visit office_path(office)
      expect(page).to have_link "Delete Office"
    end
  end

end