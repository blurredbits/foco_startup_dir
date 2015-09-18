require 'rails_helper'

RSpec.feature "User can edit existing people" do
  
  before do
    FactoryGirl.create(:person, first_name: "Mark", last_name: "Morris")

    visit "/people"
    click_link "Mark Morris"
    click_link "Edit Person"
  end
  
  scenario "with valid attributes" do
    fill_in "Last name", with: "Morrison"
    click_button "Update Person"

    expect(page).to have_content "Person has been updated."
    expect(page).to have_content "Mark Morrison"
  end

  scenario "with invalid attributes" do
    fill_in "First name", with: ""
    click_button "Update Person"

    expect(page).to have_content "Person has not been updated."
  end

end