class AddLogoToCartItemsAndOrderItems < ActiveRecord::Migration[8.0]
  def change
    add_column :cart_items, :coin_logo, :string
    add_column :order_items, :coin_logo, :string

  end
end
