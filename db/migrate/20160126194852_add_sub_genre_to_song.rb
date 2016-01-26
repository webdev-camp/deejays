class AddSubGenreToSong < ActiveRecord::Migration
  def change
    add_column :songs, :sub_genre, :string
    rename_column :songs, :genre, :main_genre
    rename_column :songs, :speed, :tempo
  end
end
