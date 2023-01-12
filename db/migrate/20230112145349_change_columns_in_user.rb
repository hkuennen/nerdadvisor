class ChangeColumnsInUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :level, :integer, default: 1
    change_column :users, :xp, :integer, default: 0
  end
end
