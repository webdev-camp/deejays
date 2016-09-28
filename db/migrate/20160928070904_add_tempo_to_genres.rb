class AddTempoToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :tempo, :integer
  end
end
