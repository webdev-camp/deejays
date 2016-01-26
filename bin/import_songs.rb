require_relative "../config/environment"
require "date"
class ImportSongs

  attr_reader :parts

  def initialize
    @lines = File.open("#{Rails.root}/db/raw/CDDJ_Songs.tsv").each_line.to_a
    puts @lines.shift.split("\t").join "\n" #header
  end

  def run
    #months = Date::MONTHNAMES.compact
    @lines.each do |line|
      parts = line.split("\t")
      created_at = Date.strptime(parts[1] , "%m/%d/%Y") rescue nil
      song = Song.new(:date_added => created_at , :user_name => parts[2] , :added => parts[1],
                      :title => parts[3] , :artist => parts[4] ,
                      :album => parts[5] , :tempo => parts[6] ,
                      :main_genre => parts[7] , :info => parts[8] )
      song.save!
    end
  end
end

ImportSongs.new.run
