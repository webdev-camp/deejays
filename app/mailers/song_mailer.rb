class SongMailer < ApplicationMailer
  layout false

  def notify(song)
    @song = song
    mail(to: Rails.application.secrets.notification_email , subject: "#{song.user.name} added a new song")
  end
end
