class Song < ActiveRecord::Base
  validates :title, :presence => true
  validates :artist, :presence => true
  validates :album, :presence => true
  validates :tempo, :presence => true
  validates :main_genre, :presence => true

  default_scope {order('date_added DESC')}

end
