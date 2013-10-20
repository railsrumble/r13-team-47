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
    @team = Team.find(params[:id]).update(permitted_params[:team])

    redirect_to team_url(@team)
  end

  def show
    @team = Team.find(params[:id])
  end

  protected
    def  permitted_params
      params.permit(team: [:url, :name, :description])
    end
end
