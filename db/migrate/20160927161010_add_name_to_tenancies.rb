class AddNameToTenancies < ActiveRecord::Migration[5.0]
  def change
    add_column :tenancies, :name, :string
  end
end
