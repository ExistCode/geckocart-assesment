class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_number
      t.decimal :total_amount
      t.string :status

      t.timestamps
    end
    add_index :orders, :order_number, unique: true
  end
end
