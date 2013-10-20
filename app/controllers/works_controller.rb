class WorksController < ApplicationController
  def create
    @team = Team.find(params[:team_id])
    CreateWork.run(@team, params)

    redirect_to edit_team_url(@team)
  end

  def destroy
    @team = Team.find(params[:team_id])
    @team.works.find(params[:id]).destroy

    redirect_to team_url(@team)
  end

end

