class NextTrainingController < ApplicationController
  before_action :set_training

  def index
    #@next_training = Training.where("date >= ?", Time.now.in_time_zone('Rome').to_date).order(:date).first
    if @next_training
      @participants_players = @next_training.participations.where(present: true)
      @not_participants_players = @next_training.participations.where(present: false)

      @bar_color_class =  if @participants_players.count < 10
                            'progress-danger'
                          elsif @participants_players.count < 12
                            'progress-warning'
                          else
                            'progress-success'
                          end
      @players_percentage = (@participants_players.count * 100.0 / 12).round

      all_participants_players = @next_training.participations.order('present DESC, created_at ASC').map {|p| p.player}
      @not_confirmed_players = Player.where.not(id: all_participants_players.collect(&:id)).order(:name)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_training
    begin
      @next_training = Training.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @next_training = Training.where("date >= ?", Time.now.in_time_zone('Rome').to_date).order(:date).first
    end
  end
end
