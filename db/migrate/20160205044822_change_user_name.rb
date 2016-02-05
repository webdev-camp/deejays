class ChangeUserName < ActiveRecord::Migration
  def change
    rename_column :users , :name , :full_name
  end
end
