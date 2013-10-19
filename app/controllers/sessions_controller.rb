class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    authentication = 
      Authentication.where(provider: auth.provider, uid: auth.uid).first || 
      Authentication.create(provider: auth.provider, uid: auth.uid)
    user = authentication.user || authentication.create_user(login: auth.info.nickname)

    session[:user_id] = user.id

    redirect_to root_url, :notice => "Signed in!"
  end
end
