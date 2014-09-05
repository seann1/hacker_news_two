class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :link_id, presence: true
  validates :content, presence: true

  belongs_to :link
  belongs_to :user
end
