class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :PAR
      t.integer :current_stock_level
      t.timestamps
    end
  end
end
