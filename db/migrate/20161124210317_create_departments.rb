class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Department.create_translation_table! :name => {:type => :string, :null => false}
      end

      dir.down do
        Department.drop_translation_table!
      end
    end
  end
end
