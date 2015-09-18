require "rails_helper"

RSpec.feature "User can create office" do

  before do
    visit "/offices"
    click_link "New Office"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Scout"
    fill_in "Description", with: "Hosted Server Monitoring Solution."
    fill_in "Location", with: "200 Walnut Street, Suite E, Fort Collins, CO 80524"
    fill_in "Website", with: "https://scoutapp.com"

    click_button "Create Office"

    expect(page).to have_content "Office has been created."
  end

  scenario "with invalid attributes" do
    # add some validations
  end
end