class AddCoinIdToCartItems < ActiveRecord::Migration[8.0]
  def change
    add_column :cart_items, :coin_id, :string
    add_index :cart_items, [:cart_id, :coin_id], unique: true
  end
end
