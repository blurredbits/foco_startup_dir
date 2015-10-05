require "rails_helper"

RSpec.feature "Users can view a company" do

  let(:creator) { FactoryGirl.create(:user) }

  scenario "with the company details" do
    company = FactoryGirl.create(:company, creator: creator, name: "Scout")

    visit "/companies"
    click_link "Scout"
    expect(page.current_url).to eq company_url(company)
  end
end