class SetDefaultPointVal < ActiveRecord::Migration
  def change
    change_column :links, :point, :integer, :default => 0
  end
end
