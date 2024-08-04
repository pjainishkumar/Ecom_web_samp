# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  # validates :address, :payment_method, presence: true
  validates :address, presence: true
  validates :province, presence: true
  enum status: { placed: 0, shipped: 1, delivered: 2, canceled: 3 }
end
