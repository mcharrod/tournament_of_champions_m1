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

  it 'registers a team and redirects to competition page' do
    fill_in("Nickname:", with: "Cats")
    fill_in("Hometown:", with: "Broadway")
    click_button("Save")
    expect(current_path).to eq("/competitions/#{@competition2.id}")
    expect(page).to have_content("Team nickname: Cats")
    expect(page).to have_content("Team hometown: Broadway")
  end
end
