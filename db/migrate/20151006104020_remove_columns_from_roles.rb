class RemoveColumnsFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :admin, :string
    remove_column :roles, :user, :string
    remove_column :roles, :sellers, :string
  end
end
