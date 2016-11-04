class CreateTenancies < ActiveRecord::Migration[5.0]
  def change
    create_table :tenancies do |t|
      t.string :tenants
      t.integer :term
      t.date :start_date
      t.date :end_date
      t.float :rent
      t.float :deposit
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
