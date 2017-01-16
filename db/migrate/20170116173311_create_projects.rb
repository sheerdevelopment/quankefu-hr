class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :comment
      t.references :project_status, foreign_key: true

      t.timestamps
    end
    add_index :projects, :name
  end
end
