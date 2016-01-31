class SongMailer < ApplicationMailer
  layout false

  def notify(song)
    @song = song
    puts @song.inspect
    mail(to: "torsten@villataika.fi" , subject: "#{song.user.name} added a new song")
  end
end
