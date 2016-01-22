RSpec.describe Song, type: :model do
  it "factorieses ok" do
   song = build :song
   expect(song.save).to be true
  end
  it "factorieses invalid" do
    song = build :invalid_song
    expect(song.save).to be false
  end
  it "checks all attributes" do
    ["title","artist", "album","speed","genre"].each do |att|
      song = build :song
      song.send "#{att}=".to_sym , ""
      expect(song.save).to be false
    end
  end
end
