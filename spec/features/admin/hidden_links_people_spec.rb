require "rails_helper"

RSpec.feature "User can only see the appropriate links" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:person) { FactoryGirl.create(:person, creator: user) }

  context "anonymous users" do
    scenario "cannot see the New Person link" do
      visit "/people"
      expect(page).not_to have_link "New Person"
    end

    scenario "cannot see the Delete Person link" do
      visit person_path(person)
      expect(page).not_to have_link "Delete Person"
    end
  end

  context "reqular users" do

    before { login_as(user) }

    scenario "cannot see the New Person link" do
      visit "/people"
      expect(page).not_to have_link "New Person"
    end

    scenario "cannot see the Delete Person link" do
      visit person_path(person)
      expect(page).not_to have_link "Delete Person"
    end
  end

  context "admin users" do
    
    before { login_as(admin) }

    scenario "can see the New Person link" do
      visit "/people"
      expect(page).to have_link "New Person"
    end

    scenario "can see the Delete Person link" do
      visit person_path(person)
      expect(page).to have_link "Delete Person"
    end
  end
end