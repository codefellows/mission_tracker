require 'spec_helper'

feature "Edit Missions" do
let!(:original_captain) {Captain.create(name: "Captain Cool") }
let!(:new_captain) {Captain.create(name: "Captain Lame") }
let!(:crew) {Crew.create(name: "2Live Crew", starship: "Iron Maiden") }
let!(:mission) { Mission.create(name: "Mission 1", objective: "Collect some stardust.") }


  scenario 'Can Edit Missions' do

    mission.captain = original_captain
    mission.crew = crew
    mission.save!

    visit "/missions/#{mission.id}"
    page.should have_content "#{mission.objective}"
    click_link "Edit"
    page.select new_captain.name, from: "mission[captain_id]"
    click_button "Update Mission"
    page.should have_content "Mission was successfully updated."
  end
end