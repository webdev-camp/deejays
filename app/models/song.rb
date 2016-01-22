class Song < ActiveRecord::Base
  validates :title, :presence => true
  validates :artist, :presence => true
  validates :album, :presence => true
  validates :speed, :presence => true
  validates :genre, :presence => true
end
