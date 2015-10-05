require "rails_helper"

RSpec.feature "Users can delete companies" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
  end

  let(:creator) { FactoryGirl.create(:user)}
  scenario "successfully" do
    FactoryGirl.create(:person, creator: creator, first_name: "Mark", last_name: "Morris")

    visit "/people"
    click_link "Mark Morris"
    click_link "Delete Person"

    expect(page).to have_content "Person has been deleted."
    expect(page.current_url).to eq people_url
    expect(page).to have_no_content "Mark Morris"
  end
end