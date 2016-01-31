class Song < ActiveRecord::Base
  validates :title, :presence => true
  validates :artist, :presence => true
  validates :album, :presence => true
  validates :tempo, :presence => true
  validates :main_genre, :presence => true

  default_scope {order('date_added DESC')}

  belongs_to :user

  def user_name
    if self.user_id
      self.user.name
    else
      self.read_attribute(:user_name)
    end
  end

  def added_on
    return self.date_added if self.date_added
    self.added
  end

end
