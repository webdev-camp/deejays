module Features
  module SongHelpers
    def fill_new_song
      genre = create :genre
      visit new_song_path
      song = build :song
      fill_song song , genre
    end
    def fill_song song , genre
      fill_in 'Title', :with => song.title
      fill_in 'Artist', :with => song.artist
      fill_in 'Album', :with => song.album
      fill_in 'Tempo', :with => song.tempo
      find("option[value='#{genre.id}']").click
      song
    end

    def add_song
      user = signed_user
      fill_new_song
      click_button 'Create Song'
      expect(page).to have_content("successfully created")
      expect(user.songs.count).to eq 1
      user
    end
  end
end
