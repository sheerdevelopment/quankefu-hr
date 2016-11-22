class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  # 3 is employee according to db:seed
  def up
    add_reference :users, :user_role, index: true, default: 3
  end

  def down
    remove_reference :users, :user_role
  end
end
