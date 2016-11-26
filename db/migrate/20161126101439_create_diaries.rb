class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
      t.references :employee, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.text :notes
      t.float :hours

      t.timestamps
    end
  end
end
