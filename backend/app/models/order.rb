class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items,dependent: :destroy

  validates :order_number, presence: true, uniqueness: true
  validates :total_amount, presence: true
  validates :status,presence: true 

  before_validation :generate_order_number, on: :create

  private
  
  def generate_order_number
    self.order_number = "ORD-#{Time.current.to_i}"
  end
end
