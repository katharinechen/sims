class CreateInventory < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.belongs_to :items, index: true
      t.integer :par, null: false
      t.integer :stock_level, null: false
    end
  end
end
