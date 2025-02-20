class OrderItem < ApplicationRecord
  belongs_to :order

  validates :coin_id, presence: true
  validates :coin_symbol, presence: true
  validates :coin_name, presence: true
  validates :coin_logo, presence: true
  validates :quantity, presence: true
  validates :price_at_time, presence: true
end
