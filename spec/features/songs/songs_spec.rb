feature 'Song list' do

  scenario "add song and view songs" do
    signed_user
    visit songs_path
    expect(current_path).to eq new_song_path
    expect(page).to have_content("Read below")
  end
end
