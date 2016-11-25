class CreateGenders < ActiveRecord::Migration[5.0]
  def change
    create_table :genders do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Gender.create_translation_table! :name => {:type => :string, :null => false}
      end

      dir.down do
        Gender.drop_translation_table!
      end
    end
  end
end
