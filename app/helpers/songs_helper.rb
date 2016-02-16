module SongsHelper
  def tempo_label(song)
    label = "Tempo"
    return label if song.new_record?
    if Song.tempo_list.index(song.tempo).nil?
      label += " (was #{song.tempo})"
    end
    label
  end
end
