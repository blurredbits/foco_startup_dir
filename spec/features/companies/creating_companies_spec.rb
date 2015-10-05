require 'rails_helper'

RSpec.feature "Users can create new companies" do

  let(:user) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(user)
    visit "/companies"
    click_link "New Company"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Scout"
    fill_in "Description", with: "Hosted Server Monitoring Solution."
    fill_in "Location", with: "200 Walnut Street, Suite E, Fort Collins, CO 80524"
    fill_in "Employees", with: 7
    fill_in "Website", with: "https://scoutapp.com"

    click_button "Create Company"

    expect(page).to have_content "Company has been created."
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""

    click_button "Create Company"
    expect(page).to have_content "Company has not been created."
  end
end