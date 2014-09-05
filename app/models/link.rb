class Link < ActiveRecord::Base
  validates :url, presence: true
  validates :url, :format => URI::regexp(%w(http https))
  validates :user_id, presence: true
  validates :title, presence: true
  validates :point, presence: true

  belongs_to :user
  has_many :comments

end
