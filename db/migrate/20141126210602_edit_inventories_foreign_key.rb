class EditInventoriesForeignKey < ActiveRecord::Migration
  def change
    rename_column :inventories, :items_id, :item_id
  end
end
