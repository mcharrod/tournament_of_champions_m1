class CompetitionTeam < ApplicationRecord
  belongs_to :competition
  belongs_to :team

  validates_presence_of :team_id, presence: true
  validates_presence_of :competition_id, presence: true
end
