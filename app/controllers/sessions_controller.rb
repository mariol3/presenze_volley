class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    player = Player.find_by_name(params[:name])
  
    if player and player.authenticate(params[:password])
      session[:player_id] = player.id
      redirect_to trainings_url
    else
      redirect_to login_url, alert: "Nome e/o password non corretti"
    end
  end

  def destroy
    session[:player_id] = nil
    redirect_to root_url, notice: "Logout eseguito correttamente"
  end
end
