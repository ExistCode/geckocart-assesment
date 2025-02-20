class AddCoinIdToOrderItem < ActiveRecord::Migration[8.0]
  def change
    add_column :order_items, :coin_id, :string
    add_index :order_items, [:order_id, :coin_id], unique: true
  end
end
