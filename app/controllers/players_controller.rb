class PlayersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create] 
  before_action :set_player
  
  # GET /players
  # GET /players.json
  def index
    @players = Player.order(:name)
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        if @logged_player
          format.html { redirect_to players_url, notice: "Giocatore #{ @player.name } creato correttamente. Accedere per continuare." }
        else
          format.html { redirect_to login_url, notice: "Giocatore #{ @player.name } creato correttamente. Accedere per continuare." }
        end
        format.json { render action: 'show', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to players_url, notice: "Player #{ @player.name } was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      if params[:id]
        @player = Player.find(params[:id])
      else
        @player = Player.new
      end
      
      @logged_player = current_logged_player
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :password, :password_confirmation, :avatar, :role)
    end
end
