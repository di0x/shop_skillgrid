class AddProToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :pro, :boolean
  end
end
