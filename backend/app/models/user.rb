class User < ApplicationRecord
  has_secure_password
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
end