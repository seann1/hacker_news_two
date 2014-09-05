require 'rails_helper'

describe Vote do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :link_id }

  it { should belong_to :link }
  it { should belong_to :user }

  # describe one_point do
  #   @link = Link.create(url: 'https://medium.com/', title: 'Medium')
  #   @link.one_point
  #   @link.point.should eq 1
  # end

end
