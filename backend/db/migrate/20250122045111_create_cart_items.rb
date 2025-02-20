class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.string :coin_symbol
      t.string :coin_name
      t.decimal :quantity
      t.decimal :price_at_time

      t.timestamps
    end
  end
end
