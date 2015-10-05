require 'rails_helper'

RSpec.feature "User can edit existing offices" do

  let(:creator) { FactoryGirl.create(:user) }
  
  before do
    FactoryGirl.create(:office, creator: creator, name: "Galvanize")

    visit "/offices"
    click_link "Galvanize"
    click_link "Edit Office"
  end
  
  scenario "with valid attributes" do
    fill_in "Name", with: "Scout APM"
    click_button "Update Office"

    expect(page).to have_content "Office has been updated."
    expect(page).to have_content "Scout APM"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Office"

    expect(page).to have_content "Office has not been updated."
  end

end