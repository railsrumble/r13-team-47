class WorksController < ApplicationController
  def create
    @team = Team.find(params[:team_id])
    CreateWork.run(@team, permitted_params[:work], site_url).tap do |work|
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

    def site_url
      params[:work][:url]
    end

    def permitted_params
      params.permit(work: [:name])
    end
end
