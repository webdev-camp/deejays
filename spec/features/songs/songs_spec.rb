feature 'Song list' do

  scenario "view songs but go to add" do
    signed_user
    visit songs_path
    expect(current_path).to eq new_song_path
    expect(page).to have_content("Read below")
  end

  scenario "view songs when given ok" do
    signed_user :given_user
    visit songs_path
    expect(current_path).to eq songs_path
    expect(page).to have_content("0 Songs")
  end

end
