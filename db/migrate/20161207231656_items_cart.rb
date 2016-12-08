class ItemsCart < ActiveRecord::Migration
  def change
    create_table :items_cart do |t|
      t.belongs_to :items, index: true
      t.belongs_to :cart, index: true
    end
  end
end
