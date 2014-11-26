class ChangeItemsTable < ActiveRecord::Migration
  def change
    remove_column :items, :par
    remove_column :items, :current_stock_level
  end
end
