require "rails_helper"

RSpec.feature "User can delete office" do
  scenario "successfully" do
    FactoryGirl.create(:office, name: "Galvanize")

    visit "/offices"
    click_link "Galvanize"
    click_link "Delete Office"

    expect(page).to have_content "Office has been deleted."
    expect(page.current_url).to eq offices_url
    expect(page).to have_no_content "Galvanize"
  end
end
