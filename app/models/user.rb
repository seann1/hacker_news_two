class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :links
  has_many :comments
  has_many :votes

end
