require 'rails_helper'

describe 'competition' do
  before do
    @competition1 = Competition.create!(name: "Boys JR", location: "Denver", sport: "baseball")
    @competition2 = Competition.create!(name: "Girls JR", location: "New York City", sport: "baseball")
    @competition3 = Competition.create!(name: "Womens", location: "Miami", sport: "basketball")

    visit "/competitions"
  end
  it 'index page displays all names' do
    expect(page).to have_content(@competition1.name)
    expect(page).to have_content(@competition2.name)
    expect(page).to have_content(@competition3.name)
  end
end
