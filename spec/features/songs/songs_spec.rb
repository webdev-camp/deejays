feature 'Song list' do

  scenario "view songs when given ok" do
    signed_user :given_user
    visit songs_path
    expect(current_path).to eq songs_path
    expect(page).to have_content("0 Songs")
  end

end
