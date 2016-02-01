class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :name, :presence => true
         validates :city, :presence => true
         validates :country, :presence => true

  has_many :songs
  scope :admin, -> { where(admin: '1') }
end
