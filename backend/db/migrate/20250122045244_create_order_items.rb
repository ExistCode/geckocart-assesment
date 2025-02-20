class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :coin_symbol
      t.string :coin_name
      t.decimal :quantity
      t.decimal :price_at_time

      t.timestamps
    end
  end
end
