class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true
  validates :price, presence: true
  validates :payment_method, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1, making: 2, ready: 3, complete: 4 }
end
