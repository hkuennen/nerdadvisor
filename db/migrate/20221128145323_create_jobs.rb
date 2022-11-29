class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :_type
      t.date :startDate
      t.integer :salary
      t.string :city
      t.string :cv
      t.string :coverLetter
      t.references :user, null: false, foreign_key: true
      t.references :employer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
