class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  # 3 is employee according to db:seed
  def up
    add_column :users, :user_role_id, :integer, default: 3
  end

  def down
    remove_column :users, :user_role_id, :integer
  end
end
