class AddUsedToUser < ActiveRecord::Migration
  def change
    add_column :users, :used, :date
    add_column :users, :count, :int , :default => 0
    add_column :users, :given, :date

    User.all.each do |user|
      user.used  = Date.today
      user.given = Date.today
      user.save!
    end
  end
end
