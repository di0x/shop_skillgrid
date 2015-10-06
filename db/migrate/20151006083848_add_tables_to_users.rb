class AddTablesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shop_name, :string
    add_column :users, :avatar, :attachment
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :passport_image, :attachment
    add_column :users, :dob, :date
  end
end
