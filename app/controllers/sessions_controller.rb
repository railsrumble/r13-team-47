class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    authentication = 
      Authentication.where(provider: auth.provider, uid: auth.uid).first || 
      Authentication.create(provider: auth.provider, uid: auth.uid)
    user = authentication.user || authentication.create_user(login: auth.info.nickname)

    session[:user_id] = user.id

    if user.teams.empty?
      redirect_to new_team_url, :notice => "Signed in!"
    else
      redirect_to team_url(user.teams.first), :notice => "Signed in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
