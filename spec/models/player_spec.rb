require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to :team }

  it { should validate_presence_of :name }
  it { should validate_presence_of :age }
  it { should validate_presence_of :team_id }
end
