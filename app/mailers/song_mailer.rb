class SongMailer < ApplicationMailer
  layout false

  def notify(song)
    @song = song
    mail(to: Rails.application.secrets.notification_email , subject: "#{song.user.full_name} added song No: #{@song.user.songs.count}")
  end
end
