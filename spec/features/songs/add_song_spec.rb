# Song adding should lead to being able to see the list
describe 'Song add' do

  scenario 'add a song and see it' do
    user = add_song
    user.reload
    expect(user.given).to be_truthy
  end

  scenario 'add a song without Artist and get error' do
    user = signed_user
    fill_new_song
    fill_in 'Artist', :with => ""
    click_button 'Create Song'
    expect(page).to have_content("review the problems")
    expect(user.songs.count).to eq 0
  end

  it "shows all form fields" do
    signed_user
    fill_new_song
    ["Add a new" , "Album" , "Artist" , "Tempo" ,"Main genre",
      "Sub genre" , "Link" , "Info"].each do |cont|
      expect(page).to have_content(cont)
    end
  end
end
