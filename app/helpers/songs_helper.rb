module SongsHelper

  def song_text song
    info = song.link
    return "" unless info
    txt = info.split(".")[1]
    txt || ""
  end
end
