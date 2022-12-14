class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :desc
      t.string :_type
      t.date :startDate
      t.integer :salary
      t.string :city
      t.references :user, null: false, foreign_key: true
      t.references :employer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
