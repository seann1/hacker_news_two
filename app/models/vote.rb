class Vote < ActiveRecord::Base
  # validates :user_id, presence: true
  validates :link_id, presence: true

  belongs_to :link
  belongs_to :user

  def one_point
    @vote = Vote.find_by(:link_id => link.id)
    @link = Link.find(@vote.link_id)
    add_one = @link.point + 1
    @link.update(:point => add_one)
  end

end
