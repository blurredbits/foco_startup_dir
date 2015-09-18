require "rails_helper"

RSpec.feature "Users can view a office" do
  scenario "with the company details" do
    office = FactoryGirl.create(:office, name: "Scout")

    visit "/offices"
    click_link "Scout"
    expect(page.current_url).to eq office_url(office)
  end
end