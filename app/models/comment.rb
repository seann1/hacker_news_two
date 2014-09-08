class Comment < ActiveRecord::Base
  # validates :user_id, presence: true
  validates :link_id, presence: true
  validates :content, presence: true

  belongs_to :link
  belongs_to :user

  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  validates :commentable_id, :presence => true

end
