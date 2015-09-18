require 'rails_helper'

RSpec.feature "User can edit existing companies" do
  
  before do
    FactoryGirl.create(:company, name: "Scout")

    visit "/"
    click_link "Scout"
    click_link "Edit Company"
  end
  
  scenario "with valid attributes" do
    fill_in "Name", with: "Scout APM"
    click_button "Update Company"

    expect(page).to have_content "Company has been updated."
    expect(page).to have_content "Scout APM"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Company"

    expect(page).to have_content "Company has not been updated."
  end

end