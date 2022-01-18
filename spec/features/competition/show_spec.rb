require 'rails_helper'

describe 'competition show page' do
  before do
    @competition3 = Competition.create!(name: "Womens", location: "Miami", sport: "basketball")
    @team1 = Team.create!(nickname: "Team", hometown: "Denver")
    @team2 = Team.create!(nickname: "Team", hometown: "Washington")

    @joins = CompetitionTeam.create!(team_id: @team1.id, competition_id: @competition3.id)
    @joins = CompetitionTeam.create!(team_id: @team2.id, competition_id: @competition3.id)

    # average age of player in team 1 is 50 (150 / 3)
    @player1 = @team1.players.create!(name: "Katy", age: 100)
    @player2 = @team1.players.create!(name: "Cody", age: 26)
    @player3 = @team1.players.create!(name: "Bob", age: 24)

    # average age of players in team 2 is 25 (75 / 3)
    @player4 = @team2.players.create!(name: "Lily", age: 20)
    @player4 = @team2.players.create!(name: "Nilly", age: 15)
    @player4 = @team2.players.create!(name: "Jillian", age: 40)

    visit "/competitions/#{@competition3.id}"
  end

  it 'shows all info for competition' do
    expect(page).to have_content(@competition3.name)
    expect(page).to have_content(@competition3.sport)
    expect(page).to have_content("location: #{@competition3.location}")
  end

  it 'has a link to register a new team' do
    expect(page).to have_link("Register a new team")
  end

  it 'displays average age of players on each team' do
    within "#team-#{@team1.id}" do
      expect(page).to have_content("Average age: 50")
    end
    within "#team-#{@team2.id}" do
      expect(page).to have_content("Average age: 25")
    end 
  end
end
