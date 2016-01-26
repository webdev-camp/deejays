class AddAddedToSong < ActiveRecord::Migration
  def change
    add_column :songs, :added, :date
  end
end
