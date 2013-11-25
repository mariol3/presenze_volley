module PlayersHelper

  def participation_button_class(training, player, present)
    participation = player.participations.where(training_id: training.id)[0]
    if participation
      if participation.present && present
        return 'btn-success'
      elsif !participation.present && !present
        return 'btn-danger'
      end
    end
    'btn-primary'
  end

end
