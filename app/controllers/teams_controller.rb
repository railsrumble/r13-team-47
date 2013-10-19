class TeamsController < ApplicationController
  inherit_resources

  def resource_params
    if request.get?
      [] 
    else
      [params.require(:team).permit(:url, :name, :description)]
    end
  end
end
