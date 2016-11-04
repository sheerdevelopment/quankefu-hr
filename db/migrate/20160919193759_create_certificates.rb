class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.string :name
      t.references :doc_type, foreign_key: true
      t.date :expiry_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
