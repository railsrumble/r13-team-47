class WorksController < ApplicationController
  def create
    @team = Team.find(params[:team_id])
    CreateWork.run(@team, permitted_params[:work]).tap do |work|
      @team.works << work
    end

    redirect_to edit_team_url(@team)
  end

  def destroy
    @team = Team.find(params[:team_id])
    @team.works.find(params[:id]).destroy

    redirect_to team_url(@team)
  end

  protected

    def permitted_params
      params.permit(work: [:url, :name])
    end
end
