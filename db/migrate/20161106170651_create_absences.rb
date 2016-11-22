class CreateAbsences < ActiveRecord::Migration[5.0]
  def change
    create_table :absences do |t|
      t.references :absence_type, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.float :days
      t.string :comments
      t.references :absence_status, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
