require "rails_helper"

RSpec.feature "Users can delete companies" do
  scenario "successfully" do
    FactoryGirl.create(:person, first_name: "Mark", last_name: "Morris")

    visit "/people"
    click_link "Mark Morris"
    click_link "Delete Person"

    expect(page).to have_content "Person has been deleted."
    expect(page.current_url).to eq people_url
    expect(page).to have_no_content "Mark Morris"
  end
end