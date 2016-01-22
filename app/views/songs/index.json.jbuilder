json.array!(@songs) do |song|
  json.extract! song, :id, :title, :artist, :album, :speed, :genre, :link, :info
  json.url song_url(song, format: :json)
end
