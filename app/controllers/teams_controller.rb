class TeamsController < WebWeightController
  def index
    @teams = Team.all
  end

  def new
    @team = current_user.teams.new
  end

  def create
    @team = Team.create(permitted_params[:team]).tap do |team|
      team.users << current_user
    end

    redirect_to team_url(@team)
  end

  def edit
    @team = current_user.teams.first
  end

  def update
    @team = Team.find(params[:id]).tap do |team|
      team.update(permitted_params[:team])
    end

    redirect_to team_url(@team)
  end

  def show
    @team = Team.find(params[:id])
  end

  def recalculate
    @team = Team.find(params[:id])
    TeamRankUpdater.run(@team)

    redirect_to edit_team_url(@team)
  end

  protected

    def permitted_params
      params.permit(team: [:url, :name, :description])
    end
end
