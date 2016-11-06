class CreateAbsenceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :absence_types do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        AbsenceType.create_translation_table! :name => {:type => :string, :null => false}
      end

      dir.down do
        AbsenceType.drop_translation_table!
      end
    end
  end
end
