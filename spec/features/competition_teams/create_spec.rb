require 'rails_helper'

describe 'create competition_team page' do
  before do
    @competition2 = Competition.create!(name: "Girls JR", location: "New York City", sport: "baseball")
    visit "/competitions/#{@competition2.id}"
    click_link "Register a new team"
  end

  it 'correct path' do
    expect(current_path).to eq("/competitions/#{@competition2.id}/competition_teams/new")
  end

  it 'has a form to register a team' do
    expect(page).to have_field("Nickname:")
    expect(page).to have_field("Hometown:")
  end
end
