require 'rails_helper'

describe 'create competition_team page' do
  before do
    @competition2 = Competition.create!(name: "Girls JR", location: "New York City", sport: "baseball")
    visit "/competitions/#{@competition2.id}"
  end

  it 'correct path' do
    click_link "Register a new team"
    expect(current_path).to eq("/competitions/#{@competition2.id}/competition_teams/new")
  end
end
