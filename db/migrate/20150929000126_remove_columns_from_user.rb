class RemoveColumnsFromUser < ActiveRecord::Migration	
  def self.up
    remove_attachment :users, :image   
  end

  def self.down
    remove_attachment :users, :image   
  end 
end
