class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :xp, :integer
    add_column :users, :linkedin, :string
    add_column :users, :github, :string
    add_column :users, :extraLink, :string
    add_column :users, :desc, :text
  end
end
