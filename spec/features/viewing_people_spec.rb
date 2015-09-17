require "rails_helper"

RSpec.feature "Users can view a person" do
  scenario "with the person details" do
    person = FactoryGirl.create(:person, first_name: "Mark", last_name: "Morris")

    visit "/people"
    click_link "Mark Morris"
    expect(page.current_url).to eq person_url(person)
  end
end