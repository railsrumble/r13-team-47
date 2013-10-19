class TeamsController < WebWeightController
  def new
    @team = current_user.teams.new
  end

  def create
    @team = Team.create(permitted_params[:team]).tap do |team|
      team.users << current_user
    end

    redirect_to teams_url(@team)
  end

  def show
    @team = current_user.teams.first
  end

  protected
    def  permitted_params
      params.permit(team: [:url, :name, :description])
    end
end
