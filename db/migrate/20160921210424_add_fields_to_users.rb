class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def up
    add_attachment :users, :avatar
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end

  def down
    remove_attachment :users, :avatar
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
