class SampleSessionsController < ApplicationController
  def create
    user = User.create(sample: true, login: 'guest')

    session[:user_id] = user.id

    if user.teams.empty?
      redirect_to new_team_url, :notice => "Signed in as #{user.login}!"
    else
      redirect_to team_url(user.teams.first), :notice => "Signed in!"
    end
  end
end
