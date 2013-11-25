class NextTrainingController < ApplicationController
  def index
    @next_training = Training.order(:date).first
    if @next_training
      @participants_players = @next_training.participations.where(present: true).count
      @bar_color_class =  if @participants_players < 10
                            'progress-danger'
                          elsif @participants_players < 12
                            'progress-warning'
                          else
                            'progress-success'
                          end
      @players_percentage = (@participants_players * 100.0 / Player.all.count).round
    end
  end
end
