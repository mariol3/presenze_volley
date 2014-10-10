class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    player = Player.find_by_name(params[:name])
  
    if player and player.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = player.auth_token
      else
        cookies[:auth_token] = player.auth_token
      end

      redirect_to trainings_url
    else
      redirect_to login_url, alert: "Nome e/o password non corretti"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "Logout eseguito correttamente"
  end
end
