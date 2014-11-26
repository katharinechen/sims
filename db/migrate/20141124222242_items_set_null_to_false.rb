class ItemsSetNullToFalse < ActiveRecord::Migration
  def change
    change_column :items, :name, :string, null: false
    change_column :items, :par, :integer, null: false
    change_column :items, :current_stock_level, :integer, null: false
  end
end
