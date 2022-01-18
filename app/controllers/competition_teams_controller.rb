class CompetitionTeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    @competition = Competition.find(params[:competition_id])
    new_team = @competition.teams.create!(nickname: params[:nickname],
                                          hometown: params[:hometown])
    redirect_to "/competitions/#{@competition.id}"
  end
end
