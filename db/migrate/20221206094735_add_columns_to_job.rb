class AddColumnsToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :companySize, :string
    add_column :jobs, :category, :string
    add_column :jobs, :onsite, :string
  end
end
