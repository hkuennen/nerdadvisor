class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :city, :string
    add_column :users, :category, :string
    add_column :users, :skills, :text, array: true, default: []
    add_column :users, :role, :string
    add_column :users, :xp, :integer
    add_column :users, :level, :integer
    add_column :users, :linkedin, :string
    add_column :users, :github, :string
    add_column :users, :extraLink, :string
    add_column :users, :desc, :text
  end
end
