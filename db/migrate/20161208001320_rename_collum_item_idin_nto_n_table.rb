class RenameCollumItemIdinNtoNTable < ActiveRecord::Migration
  def change
      rename_column :carts_items, :items_id, :item_id
  end
end
