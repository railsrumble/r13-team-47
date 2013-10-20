class WorksController < ApplicationController
  def create
    @team = Team.find(params[:team_id])
    CreateWork.run(@team, params)
    TeamRankUpdater.run(@team)

    redirect_to edit_team_url(@team)
  end

  def destroy
    @team = Team.find(params[:team_id])
    @team.works.find(params[:id]).destroy
    TeamRankUpdater.run(@team)

    redirect_to edit_team_url(@team)
  end

end

