require "rails_helper"

RSpec.feature "User can create new person" do

  before do
    visit "/people"
    click_link "New Person"
  end

  scenario "with valid attributes" do
    fill_in "First name", with: "Mark"
    fill_in "Last name", with: "Morris"
    fill_in "Bio", with: "Wants to be a developer when he grows up."
    click_button "Create Person"

    expect(page).to have_content "Person has been created."
  end

  scenario "with invalid attributes" do
    fill_in "First name", with: ""

    click_button "Create Person"
    expect(page).to have_content "Person has not been created."
  end
end