class CreateAbsenceStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :absence_statuses do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        AbsenceStatus.create_translation_table! :name => {:type => :string, :null => false}
      end

      dir.down do
        AbsenceStatus.drop_translation_table!
      end
    end
  end
end
