require "rails_helper"

RSpec.feature "Users can view a company" do
  scenario "with the company details" do
    company = FactoryGirl.create(:company, name: "Scout")

    visit "/companies"
    click_link "Scout"
    expect(page.current_url).to eq company_url(company)
  end
end