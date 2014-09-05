class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :link_id, :integer
      t.column :user_id, :integer
    end
  end
end
