class AddDateAddedToSong < ActiveRecord::Migration
  def change
    add_column :songs, :date_added, :date
  end
end
