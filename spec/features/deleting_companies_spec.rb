require "rails_helper"

RSpec.feature "Users can delete companies" do
  scenario "successfully" do
    FactoryGirl.create(:company, name: "Scout")

    visit "/"
    click_link "Scout"
    click_link "Delete Company"

    expect(page).to have_content "Company has been deleted."
    expect(page.current_url).to eq companies_url
    expect(page).to have_no_content "Scout"
  end
end