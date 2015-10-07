class AddShopNameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :shop_name, :string
  end
end
