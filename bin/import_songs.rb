require_relative "../config/environment"
require "date"
class ImportSongs

  attr_reader :parts

  def initialize

    @lines = File.open("#{Rails.root}/db/raw/CDDJ_Songs.tsv").each_line.to_a
    puts @lines.shift.split("\t").join "\n" #header
    @genre = Genre.find_or_create_by( :name => "unspecified" )
  end

  def run
    unn = "unspecified"
    @lines.each do |line|
      parts = line.split("\t")
      created = parts[0]
      created = parts[1] unless created.blank?
      created_date = Chronic.parse( created)
      title  = parts[3]
      title = unn if title.blank?
      artist  = parts[4]
      artist = unn if artist.blank?
      album  = parts[5]
      album = unn if album.blank?
      tempo  = parts[6]
      tempo = unn if tempo.blank?
      song = Song.new(:date_added => created_date , :user_name => parts[2] , :added => created,
                      :title =>  title, :artist => artist ,
                      :album => album , :tempo => tempo , :main_genre => @genre ,
                      :sub_genre => parts[7] , :info => parts[8] )
      song.save!
      puts "Saved #{song.title}"
    end
  end
end

ImportSongs.new.run
