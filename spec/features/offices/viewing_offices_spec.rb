require "rails_helper"

RSpec.feature "Users can view a office" do

  let(:creator) { FactoryGirl.create(:user) }
  scenario "with the company details" do
    office = FactoryGirl.create(:office, creator: creator, name: "Scout")

    visit "/offices"
    click_link "Scout"
    expect(page.current_url).to eq office_url(office)
  end
end