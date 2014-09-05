require 'rails_helper'

describe Comment do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :link_id }
  it { should validate_presence_of :content }

  it { should belong_to :link }
  it { should belong_to :user }

end
