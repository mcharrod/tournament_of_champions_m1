class Player < ApplicationRecord
  belongs_to :team

  validates_presence_of :name, presence: true
  validates_presence_of :age, presence: true
  validates_presence_of :team_id, presence: true
end
