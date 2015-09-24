class RemovePasswordSaltUser < ActiveRecord::Migration
  def change
  end

  def up
    remove_column :user, :password_salt
  end

end
