require 'rails_helper'

describe 'competition show page' do
  before do
    @competition3 = Competition.create!(name: "Womens", location: "Miami", sport: "basketball")
    visit "/competitions/#{@competition3.id}"
  end

  it 'shows all info for competition' do
    save_and_open_page
    expect(page).to have_content(@competition3.name)
    expect(page).to have_content(@competition3.sport)
    expect(page).to have_content("location: #{@competition3.location}")
  end
end