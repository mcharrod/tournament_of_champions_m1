class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  validates :nickname, presence: true
  validates :hometown, presence: true

  def average_age
    players.average(:age)
  end
end
