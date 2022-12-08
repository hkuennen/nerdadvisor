class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :_class, :string, default: "Newbie"
  end
end
