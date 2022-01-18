require 'rails_helper'

RSpec.describe CompetitionTeam, type: :model do
  it { should belong_to :competition }
  it { should belong_to :team }

  it { should validate_presence_of :team_id }
  it { should validate_presence_of :competition_id }
end
