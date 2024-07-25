class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  # validates :address, :payment_method, presence: true
  validates :address, presence: true
  validates :province, presence: true
end
