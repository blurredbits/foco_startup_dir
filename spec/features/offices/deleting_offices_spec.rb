require "rails_helper"

RSpec.feature "User can delete office" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
  end

  let(:creator) { FactoryGirl.create(:user) }
  scenario "successfully" do
    FactoryGirl.create(:office, name: "Galvanize", creator: creator)

    visit "/offices"
    click_link "Galvanize"
    click_link "Delete Office"

    expect(page).to have_content "Office has been deleted."
    expect(page.current_url).to eq offices_url
    expect(page).to have_no_content "Galvanize"
  end
end
