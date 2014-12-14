class EditInventoriesRenameStock < ActiveRecord::Migration
  def change
    rename_column :inventories, :stock_level, :on_hand
  end
end
