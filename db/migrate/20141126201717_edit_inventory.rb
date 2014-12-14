class EditInventory < ActiveRecord::Migration
  def change
    change_table :inventories do |t| 
      t.timestamps 
    end
  end
end
