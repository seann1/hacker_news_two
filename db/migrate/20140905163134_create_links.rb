class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :title
      t.string :url
      t.integer :point

      t.timestamps
    end
  end
end
