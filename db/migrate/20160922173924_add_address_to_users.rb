class AddAddressToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :address, :string
  end

  def down
    remove_column :users, :address, :string
  end
end
