class CreateUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        UserRole.create_translation_table! :name => {:type => :string, :null => false}
      end

      dir.down do
        UserRole.drop_translation_table!
      end
    end
  end
end
