class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :postcode, limit: 50
      t.string :city, limit: 100
      t.string :county, limit: 100
      t.string :line1, limit: 100
      t.string :line2, limit: 100
      t.string :country, limit: 50
      t.references :user, foreign_key: true
      t.references :department, foreign_key: true
      t.string :first_name, limit: 100
      t.string :middle_name, limit: 100
      t.string :last_name, limit: 100
      t.date :dob
      t.string :mobile, limit: 100
      t.string :title, limit: 100
      t.references :gender, foreign_key: true
      t.attachment :avatar

      t.timestamps
    end
  end
end
