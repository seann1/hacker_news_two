class User < ActiveRecord::Base
  # validates :name, presence: true

  has_secure_password

  has_many :links
  has_many :comments
  has_many :votes
  validates_uniqueness_of :email

end
