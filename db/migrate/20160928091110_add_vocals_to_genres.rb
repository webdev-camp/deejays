class AddVocalsToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :vocals, :boolean
  end
end
