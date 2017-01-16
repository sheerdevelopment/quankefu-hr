class CreateProjectStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :project_statuses do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ProjectStatus.create_translation_table! :name => {:type => :string, :null => false}
      end

      dir.down do
        ProjectStatus.drop_translation_table!
      end
    end
  end
end
