class CartItem < ApplicationRecord
  belongs_to :cart

  # Validation
  validates :coin_id, presence: true
  validates :coin_symbol, presence: true
  validates :coin_name, presence: true
  validates :coin_logo, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price_at_time, presence: true

end
