class Genre < ActiveRecord::Base
  validates :name, length: { in: 3..20}
  validates :tempo, numericality: { only_integer: true, :greater_than => 10, :less_than => 200}

  default_scope {order('name ASC')}


end
