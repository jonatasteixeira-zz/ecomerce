class ItemsCartToCartsItems < ActiveRecord::Migration
  def change
    rename_table :items_cart, :carts_items
  end
end
