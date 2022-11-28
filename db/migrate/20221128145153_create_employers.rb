class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.string :companyName
      t.string :location
      t.string :city
      t.string :street
      t.integer :postcode
      t.string :market
      t.string :recruiterFirstName
      t.string :recruiterLastName
      t.string :recruiterEmail

      t.timestamps
    end
  end
end
