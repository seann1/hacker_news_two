class Link < ActiveRecord::Base
  validates :url, presence: true
  validates :url, :format => URI::regexp(%w(http https))
  validates :title, presence: true
  validates :point, presence: true
  # validates :user_id, presence: true

  has_many :comments, :as => :commentable
  belongs_to :user
  has_many :comments
  has_many :votes

  accepts_nested_attributes_for :comments,
                                reject_if:lambda { |attrs|
                                  attrs.all? { |key, value| value.blank? }
                                },
                                allow_destroy:true

end
