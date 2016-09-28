feature 'Genre list' do

  scenario "view genres" do
    visit genres_path
    expect(page).to have_content("Listing genres")
  end


  it "validates without tempo" do
    visit new_genre_path
    genre = build :genre
    fill_in 'Name', :with => genre.name
    click_button 'Create Genre'
    expect(page).to have_content("review the problems")
  end


  scenario "add a valid genre" do
    visit new_genre_path
    genre = build :genre
    fill_in 'Name', :with => genre.name
    fill_in 'Tempo', :with => genre.tempo
    check 'Vocals'
    click_button 'Create Genre'
    expect(page).to have_content("successfully created")
  end

end
