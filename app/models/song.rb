class Song < ActiveRecord::Base
  validates :title, :presence => true
  validates :artist, :presence => true
  validates :album, :presence => true
  validates :tempo, :presence => true
  validates :main_genre, :presence => true
end
