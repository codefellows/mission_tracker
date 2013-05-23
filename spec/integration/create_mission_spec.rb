require 'spec_helper'

feature "Create Missions" do
let!(:captain) {Captain.create(name: "Captain Cool") }
let!(:crew) {Crew.create(name: "2Live Crew", starship: "Iron Maiden") }

  scenario 'Can Create Missions From a Drop Down Menu' do
    visit '/'
    click_link "New Mission"
    fill_in "Name", with: "Mission 1"
    fill_in "Objective", with: "Collect Some Moonrocks!"
    page.select captain.name, from: "mission[captain_id]"
    page.select crew.name,  from: "mission[crew_id]"
    click_button "Create Mission"
    page.should have_content "Mission was successfully created."
  end
end