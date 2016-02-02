# Feature: User edit
#   As a user
#   I want to edit my user profile
#   So I can change my email address
feature 'Song add' do

  def fill_song
    visit new_song_path
    song = create :song
    fill_in 'Title', :with => song.title
    fill_in 'Artist', :with => song.artist
    fill_in 'Album', :with => song.album
    fill_in 'Tempo', :with => song.tempo
    fill_in 'Main genre', :with => song.main_genre
  end

  def add_song
    user = signed_user
    fill_song
    click_button 'Create Song'
    expect(page).to have_content("successfully created")
    expect(user.songs.count).to eq 1
    user
  end

  scenario 'add a song and see it' do
    user = add_song
    user.reload
    expect(user.given).to be_truthy
  end

  scenario 'add a song without tempo and get error' do
    user = signed_user
    fill_song
    fill_in 'Tempo', :with => ""
    click_button 'Create Song'
    expect(page).to have_content("review the problems")
    expect(user.songs.count).to eq 0
  end

  scenario "add song and view songs" do
    user = add_song
    visit songs_path
    expect(current_path).to eq songs_path
    expect(page).to have_no_content("Read below")
  end
end
