class PlayerMailer < ActionMailer::Base
  def welcome_email(player)
    @player = player
    mail(from: "Presenze Volley <presenze.volley@gmail.com>", to: @player.email, subject: 'Benvenuto su Presenze Volley :-)')
  end
end
