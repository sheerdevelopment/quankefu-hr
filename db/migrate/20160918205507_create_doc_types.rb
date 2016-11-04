class CreateDocTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :doc_types do |t|
      t.string :name, limit: 80

      t.timestamps
    end
    add_index :doc_types, :name
  end
end
