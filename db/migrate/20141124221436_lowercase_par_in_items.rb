class LowercaseParInItems < ActiveRecord::Migration
  def change
    rename_column :items, :PAR, :par
  end
end
