class ChangeSongMainGenre < ActiveRecord::Migration
  def change
    remove_column :songs, :main_genre
    add_column :songs, :main_genre_id, :integer
  end
end
