class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  validates_presence_of :name, presence: true
  validates_presence_of :location, presence: true
  validates_presence_of :sport, presence: true
end
