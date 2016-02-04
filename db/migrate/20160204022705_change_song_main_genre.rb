class ChangeSongMainGenre < ActiveRecord::Migration
  def change
    rename_column :songs, :main_genre, :main_genre_id
    change_column :songs, :main_genre_id, :integer
  end
end
