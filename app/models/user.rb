class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :links
  has_many :comments
end
