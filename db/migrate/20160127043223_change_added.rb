class ChangeAdded < ActiveRecord::Migration
  def change
    change_column :songs, :added, :string
  end
end
